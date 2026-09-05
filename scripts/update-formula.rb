require "digest"
require "json"
require "net/http"
require "uri"

module FormulaUpdater
  PACKAGES = %w[
    cli-darwin-arm64
    cli-darwin-x64
    cli-linux-arm64
    cli-linux-x64
  ].freeze
  VERSION_PATTERN = /\A\d+\.\d+\.\d+\z/
  SHA256_PATTERN = /\A[0-9a-f]{64}\z/
  CHECKSUMS_ENV = "AIO_PROXY_CHECKSUMS".freeze
  FORMULA_PATH = File.expand_path("../Formula/aio-proxy.rb", __dir__)

  # Only the manual workflow_dispatch path downloads, and npm's CDN can 404 a
  # freshly published tarball for minutes, per package rather than per release.
  # This retry is that path's only protection against the lag, so it is also what
  # lets the workflow skip a separate availability-polling job.
  DOWNLOAD_ATTEMPTS = 30
  DOWNLOAD_RETRY_DELAY = 20

  def self.tarball_url(package, version)
    "https://registry.npmjs.org/@aio-proxy/#{package}/-/#{package}-#{version}.tgz"
  end

  def self.render(version, checksums)
    <<~FORMULA
      class AioProxy < Formula
        desc "All-in-one LLM API proxy"
        homepage "https://github.com/aio-proxy/aio-proxy"
        license "MIT"

        on_macos do
          on_arm do
            url "#{tarball_url("cli-darwin-arm64", version)}"
            sha256 "#{checksums.fetch("cli-darwin-arm64")}"
          end
          on_intel do
            url "#{tarball_url("cli-darwin-x64", version)}"
            sha256 "#{checksums.fetch("cli-darwin-x64")}"
          end
        end

        on_linux do
          on_arm do
            url "#{tarball_url("cli-linux-arm64", version)}"
            sha256 "#{checksums.fetch("cli-linux-arm64")}"
          end
          on_intel do
            url "#{tarball_url("cli-linux-x64", version)}"
            sha256 "#{checksums.fetch("cli-linux-x64")}"
          end
        end

        def install
          bin.install "bin/aio-proxy"
          bin.install_symlink "aio-proxy" => "aiop"
        end

        test do
          assert_equal version.to_s, shell_output("\#{bin}/aio-proxy --version").strip
          assert_equal version.to_s, shell_output("\#{bin}/aiop --version").strip
        end
      end
    FORMULA
  end

  # Checksums supplied by the aio-proxy release that published these tarballs
  # (scripts/homebrew-notify.ts), hashed from the bytes the registry served it —
  # the same bytes `brew install` will fetch and verify below. Because producing
  # them required a successful download, their arrival also proves the CDN is
  # already serving this version.
  #
  # These land in a generated Ruby file, so validate the shape strictly instead of
  # interpolating whatever the payload happened to carry.
  def self.checksums_from_env(env = ENV)
    raw = env[CHECKSUMS_ENV].to_s.strip
    return nil if raw.empty?

    parsed = begin
      JSON.parse(raw)
    rescue JSON::ParserError => e
      raise "#{CHECKSUMS_ENV} is not valid JSON: #{e.message}"
    end
    # `toJSON()` of an absent payload key renders the literal "null", which is how
    # the manual workflow_dispatch path arrives here. Fall back to downloading.
    return nil if parsed.nil?
    raise "#{CHECKSUMS_ENV} must be a JSON object" unless parsed.is_a?(Hash)

    PACKAGES.to_h do |package|
      checksum = parsed[package]
      raise "#{CHECKSUMS_ENV} is missing a sha256 for #{package}" if checksum.nil?
      unless checksum.is_a?(String) && SHA256_PATTERN.match?(checksum)
        raise "#{CHECKSUMS_ENV}[#{package}] is not a lowercase hex sha256: #{checksum.inspect}"
      end

      [package, checksum]
    end
  end

  def self.download_checksum(package, version)
    url = tarball_url(package, version)
    attempt = 0
    begin
      attempt += 1
      response = Net::HTTP.get_response(URI(url))
      raise "#{url}: HTTP #{response.code}" unless response.is_a?(Net::HTTPSuccess)

      Digest::SHA256.hexdigest(response.body)
    rescue StandardError => e
      raise if attempt >= DOWNLOAD_ATTEMPTS

      warn "#{e.message} (attempt #{attempt}/#{DOWNLOAD_ATTEMPTS}); retrying in #{DOWNLOAD_RETRY_DELAY}s"
      sleep DOWNLOAD_RETRY_DELAY
      retry
    end
  end

  def self.update(version, checksums = nil)
    checksums ||= PACKAGES.to_h do |package|
      [package, download_checksum(package, version)]
    end
    File.write(FORMULA_PATH, render(version, checksums))
  end
end

if $PROGRAM_NAME == __FILE__
  version = ARGV.fetch(0) { abort "usage: ruby scripts/update-formula.rb X.Y.Z" }
  abort "invalid version: #{version}" unless FormulaUpdater::VERSION_PATTERN.match?(version)

  FormulaUpdater.update(version, FormulaUpdater.checksums_from_env)
end

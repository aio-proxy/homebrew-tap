require "digest"
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
  FORMULA_PATH = File.expand_path("../Formula/aio-proxy.rb", __dir__)

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
        end

        test do
          assert_equal version.to_s, shell_output("\#{bin}/aio-proxy --version").strip
        end
      end
    FORMULA
  end

  def self.download_checksum(package, version)
    url = tarball_url(package, version)
    response = Net::HTTP.get_response(URI(url))
    raise "#{url}: HTTP #{response.code}" unless response.is_a?(Net::HTTPSuccess)

    Digest::SHA256.hexdigest(response.body)
  end
end

if $PROGRAM_NAME == __FILE__
  version = ARGV.fetch(0) { abort "usage: ruby scripts/update-formula.rb X.Y.Z" }
  abort "invalid version: #{version}" unless FormulaUpdater::VERSION_PATTERN.match?(version)

  checksums = FormulaUpdater::PACKAGES.to_h do |package|
    [package, FormulaUpdater.download_checksum(package, version)]
  end
  File.write(FormulaUpdater::FORMULA_PATH, FormulaUpdater.render(version, checksums))
end

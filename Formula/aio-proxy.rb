class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.31.0/cli-darwin-arm64-0.31.0.tgz"
      sha256 "a54a5f41d95535f84cddc7bbd91de3f8e450346fa3534d871236833ec9aea796"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.31.0/cli-darwin-x64-0.31.0.tgz"
      sha256 "3a8b02898e453b3f0a36d96107753acbc65ce3e6c2a4a53dc239750382354363"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.31.0/cli-linux-arm64-0.31.0.tgz"
      sha256 "94b66638fb3c8523ca1b7b9fbce356387ec797f5760e51569d6dda52f24f9464"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.31.0/cli-linux-x64-0.31.0.tgz"
      sha256 "cb96f6e3aec35c1d47141aae6dfe1aa71c518c246f681f479e74698c80b27537"
    end
  end

  def install
    bin.install "bin/aio-proxy"
    bin.install_symlink "aio-proxy" => "aiop"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
    assert_equal version.to_s, shell_output("#{bin}/aiop --version").strip
  end
end

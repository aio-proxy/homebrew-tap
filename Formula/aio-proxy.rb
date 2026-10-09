class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.0/cli-darwin-arm64-0.42.0.tgz"
      sha256 "e3229a6ad0c2c3d5ccb5811d764a1f6115308ea6b2e8a50932f8df2b9057fffe"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.0/cli-darwin-x64-0.42.0.tgz"
      sha256 "62b0bf2e1588ee11b8aabcae9b3fb9c70493849f8f2128263fe8ee069b83fb13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.0/cli-linux-arm64-0.42.0.tgz"
      sha256 "7a3b8008d3d50760232d40b6a9d0c9dd08334f718a95a6d0ed99025af84b9eca"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.0/cli-linux-x64-0.42.0.tgz"
      sha256 "bcdbc02deb63670f17df6959b2a21c475e4aef13ceaa0b420f0fcaf1f2d8a78b"
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

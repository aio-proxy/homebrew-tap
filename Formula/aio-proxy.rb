class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.0/cli-darwin-arm64-0.27.0.tgz"
      sha256 "d5d7da825cce65dcbd773210bc832257f3cdadecc41a1835a499edbdc97983e4"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.0/cli-darwin-x64-0.27.0.tgz"
      sha256 "25eb6db3dcde5bff27bb11045ac4f29e3d93805943f9a759427fe09756cbc4e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.0/cli-linux-arm64-0.27.0.tgz"
      sha256 "e3e2c1ad8bc672da918879378e07c76ceeb4552a30e6742c497b4cbef77b6372"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.0/cli-linux-x64-0.27.0.tgz"
      sha256 "1054d097b641b1ade617d1de92761141532f5ffb61b160433f558677a490aa5d"
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

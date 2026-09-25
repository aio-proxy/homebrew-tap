class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.4/cli-darwin-arm64-0.33.4.tgz"
      sha256 "52be4b1fd561dc8951507498b4c256db481f8cb1a0afaa66c6cf6eeed63a01a5"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.4/cli-darwin-x64-0.33.4.tgz"
      sha256 "681afcf9ac8cb323e6b41b0dfe61d11075b8ce246cbd18c1d519129315055f42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.4/cli-linux-arm64-0.33.4.tgz"
      sha256 "97dd849ab3a34fa95821aa796c8d891396141a9b286305baa5bc37e1d99ad42c"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.4/cli-linux-x64-0.33.4.tgz"
      sha256 "be9cd0ecda5745c290ce535af55beaa68e700c45273a01511a114bb82f6d9f48"
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

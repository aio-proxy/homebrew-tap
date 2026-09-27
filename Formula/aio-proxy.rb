class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.34.0/cli-darwin-arm64-0.34.0.tgz"
      sha256 "a9e02a0c56b951b76e526f32679feb959d3f888081d41a39d35a8ed6ab9d428f"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.34.0/cli-darwin-x64-0.34.0.tgz"
      sha256 "00f1a0b90c1d77251f8a2405ddc493081baae2b328a78525951372c487c97931"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.34.0/cli-linux-arm64-0.34.0.tgz"
      sha256 "170f12cfeedf3c94185d12f231f4736ffb462e649232e29798c1678b093725be"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.34.0/cli-linux-x64-0.34.0.tgz"
      sha256 "d0d6d1d37823b78fe19fb28af9e57d33098b88ef964498f1a814a29c6afee6f1"
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

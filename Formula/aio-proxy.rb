class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.1/cli-darwin-arm64-0.33.1.tgz"
      sha256 "7a49ccebdb148e258501974a8de5f44d783f598a4cd309a04c99bd485162b6db"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.1/cli-darwin-x64-0.33.1.tgz"
      sha256 "aad0e2a52c75d734865d7a684bd29bfa5d1e9bedf31b8ca54e64641bb3d85388"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.1/cli-linux-arm64-0.33.1.tgz"
      sha256 "038755d050b23c77b39d95d52cabe3be0bf26670dcd148d49e5455ea59ffbf7f"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.1/cli-linux-x64-0.33.1.tgz"
      sha256 "01e973f4264c00e2f8bf3e06ebccfd4467584b0d62c7606e2b5f976385d543f1"
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

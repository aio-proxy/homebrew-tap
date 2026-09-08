class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.4/cli-darwin-arm64-0.20.4.tgz"
      sha256 "816e92b77d6aa91eae2a81d7c2b6634e30ec9928102cdf5a813055e4f278b799"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.4/cli-darwin-x64-0.20.4.tgz"
      sha256 "84ae321416f61d8ddc326dd7317091b9b5b964f9c84945b3c1e202f0064076e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.4/cli-linux-arm64-0.20.4.tgz"
      sha256 "f71e212c1b8e7079b0c7f9acd86ed7123a264738f9d7375b195f52e72f8fa0d7"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.4/cli-linux-x64-0.20.4.tgz"
      sha256 "c98991115266cc898fb5aeb2d5ca6567a188c98fee58f30b8274f3749ef82fe5"
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

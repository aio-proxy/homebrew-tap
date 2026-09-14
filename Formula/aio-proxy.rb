class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.1/cli-darwin-arm64-0.22.1.tgz"
      sha256 "72cb31f43571e577b5ac139547b1767036114144ac2a527d8c4cdc198e6520e6"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.1/cli-darwin-x64-0.22.1.tgz"
      sha256 "28435d421f539dcf409916b2954097342661007ba1bf603b92b5a8658bf9b9ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.1/cli-linux-arm64-0.22.1.tgz"
      sha256 "b7024ca7ece951ec8f7bc6a0c89ebd00c45d0f5b80d1ee132a1571a8a01c3f48"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.1/cli-linux-x64-0.22.1.tgz"
      sha256 "373b5df29a2424df36cd7c647df82d8220bcb04560663fecdbd9d68dbb4a7a87"
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

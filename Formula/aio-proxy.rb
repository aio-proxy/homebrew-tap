class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.0/cli-darwin-arm64-0.35.0.tgz"
      sha256 "d07eee6944dc8c9c00f6980f69ac11b57c617b25fc96198ca047c51e0b975a31"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.0/cli-darwin-x64-0.35.0.tgz"
      sha256 "bdcbaf038a0e5e8507543ebf84ad669ae5d9a9e7eca8bf36cf2408c9688d5812"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.0/cli-linux-arm64-0.35.0.tgz"
      sha256 "f313eb9988e57c0392a51d75cd8eb8698ffe4408171257a0a8249fbfbd3ad075"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.0/cli-linux-x64-0.35.0.tgz"
      sha256 "f4c35128f7947c1c96401134699e1501c1c71cf247aa4614a26b6173323f92b6"
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

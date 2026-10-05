class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.1/cli-darwin-arm64-0.39.1.tgz"
      sha256 "414df9bd0562d2a781951adbd84b486dac0b36e55b9927e7b38abb90f72616cb"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.1/cli-darwin-x64-0.39.1.tgz"
      sha256 "ffd25f57fee1f7d64b279a3caaab8c281d49bdc2bab47240c3acaddf96ce703b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.1/cli-linux-arm64-0.39.1.tgz"
      sha256 "8552675b37ecd56f957e27e9bf11cc06402e98e44d53c9a49b9e52d1b259498c"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.1/cli-linux-x64-0.39.1.tgz"
      sha256 "a28b8212a82815c0443df6d7f6f1c798c5b77902562a5145ed0989a851be33ce"
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

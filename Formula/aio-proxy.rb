class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.0/cli-darwin-arm64-0.23.0.tgz"
      sha256 "6bd080c8b0cf0ce8ab8ca29167616aeffd159f4c9702b0dfb1d1ca11bfde6d06"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.0/cli-darwin-x64-0.23.0.tgz"
      sha256 "1a7cc697708560487bcc644ac32c88c9f8af46f1c53650946990656069519d9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.0/cli-linux-arm64-0.23.0.tgz"
      sha256 "70dc5b36ba5d6be1fce9a57b85d68b835b00124b1a0ccae7f42f4dddf2f7172a"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.0/cli-linux-x64-0.23.0.tgz"
      sha256 "4ff76af0b42d611c891f9f30c5711278ce4afd37ba4ef0642a8f6fdcbe1f1937"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.3/cli-darwin-arm64-0.42.3.tgz"
      sha256 "50a203f5b0ff0731337183bf1a223b307d68b12d65b7128108e52b36bb60c92b"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.3/cli-darwin-x64-0.42.3.tgz"
      sha256 "5327617cd844f25c95a757fc63cfc4779ae6f9ec00b7e5044b98aad835e7f5be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.3/cli-linux-arm64-0.42.3.tgz"
      sha256 "40746806a4696fd399f33857d1b77988227b089269d03f6857911f49c2226210"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.3/cli-linux-x64-0.42.3.tgz"
      sha256 "21084ed317d4797c0f0e02d502beaea5701b28bdc8546621b03bc369b719705c"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.1/cli-darwin-arm64-0.35.1.tgz"
      sha256 "187519eb1bec25205fd1144389ae5ce452d0cb1b7eb21d8ac69bf35290515e6e"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.1/cli-darwin-x64-0.35.1.tgz"
      sha256 "f37e6b167d03192fb94441cbf4b63dbe2f900e6cd6de5c91498eabc2e9f6c9ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.1/cli-linux-arm64-0.35.1.tgz"
      sha256 "0cfef538e3ca98b66709db16b1f68d07a53a586f023a3ad620d1cc1cac368219"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.35.1/cli-linux-x64-0.35.1.tgz"
      sha256 "0f01a68ea5b5aa43724b22f4474ac0dbf722120a964dcd3351793702617b98c9"
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

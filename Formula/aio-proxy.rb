class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.26.0/cli-darwin-arm64-0.26.0.tgz"
      sha256 "0ad6604a4ec1e4e372f3002b643f6a7e4616af20bf36ea8ffce051828f4d8edd"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.26.0/cli-darwin-x64-0.26.0.tgz"
      sha256 "bf4d1c78f084760248a384de5b8f0297e0b14c4c4fe525ac7439c0de2070e437"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.26.0/cli-linux-arm64-0.26.0.tgz"
      sha256 "f207d67749686a4307c30973cd612c4b79769ba82a30ad4dc07dca0d6325816d"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.26.0/cli-linux-x64-0.26.0.tgz"
      sha256 "8a9ee2a26add7b5a201498eaaf4834fb18a356aca5fac7bc39cf4f7ef797a2e2"
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

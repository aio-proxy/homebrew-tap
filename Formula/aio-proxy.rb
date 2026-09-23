class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.32.0/cli-darwin-arm64-0.32.0.tgz"
      sha256 "e850722ac8a11a9745ae28476b00b875297f7cff25c6232c7ce472c615c0f1c4"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.32.0/cli-darwin-x64-0.32.0.tgz"
      sha256 "2ff96253160505cac453e59f617a5b671148a74d9a25a846b83f7685694582a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.32.0/cli-linux-arm64-0.32.0.tgz"
      sha256 "b6f25046574674859707e3f4c95037bdc24a5ff84cda2a2044a3da6ab3135af1"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.32.0/cli-linux-x64-0.32.0.tgz"
      sha256 "b336e843e0385c164c183fb1f097d181f94a7af89a8e10be7e71aff4098a6c4e"
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

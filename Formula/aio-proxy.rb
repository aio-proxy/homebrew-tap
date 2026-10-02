class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.38.0/cli-darwin-arm64-0.38.0.tgz"
      sha256 "c5e4de39a5be6e6c164799a6e51a7e311d10be403c3c4c3b98ecdeccd9d15777"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.38.0/cli-darwin-x64-0.38.0.tgz"
      sha256 "dc5b0396711e5f1420e19991ff2aab89a2bb75ad76414404dcb6dec5d92bd8ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.38.0/cli-linux-arm64-0.38.0.tgz"
      sha256 "c2614a9a88713b9d1ef7aabaf57cc822c8f4ae114defd3c1500080c56242d856"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.38.0/cli-linux-x64-0.38.0.tgz"
      sha256 "652891094157a78643e2a513b7eb9c1c42feb373890e3592e77f88048c15a72f"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.0/cli-darwin-arm64-0.41.0.tgz"
      sha256 "798944646e28862217a960ec3120640b4e3cd5c2adb28d30539197991bc8cf26"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.0/cli-darwin-x64-0.41.0.tgz"
      sha256 "afede7f25319ab82b75fcf6d830871620fc91bb0706fb4850d6815d986c65a06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.0/cli-linux-arm64-0.41.0.tgz"
      sha256 "be0c6a5bfa0c1433402a02d0b5deee5e098084db82c38d5cc1bcd05f61022892"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.0/cli-linux-x64-0.41.0.tgz"
      sha256 "ce6ffd00294d754abcc6bb3692f54df3903602fc930b9b52a8e907c5ac778a8b"
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

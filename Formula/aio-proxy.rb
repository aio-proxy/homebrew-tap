class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.11.1.tgz"
      sha256 "9acaedfdf207a09d390b12bf9bdb9d600656c275fdb91c2f56b82ee0bc8cece2"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.11.1.tgz"
      sha256 "68109ebee1327fb1298a2caf6c4f8ebe13c894ab38aaee08507b11a3ecb923b0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.11.1.tgz"
      sha256 "2653eb53eb0224f2572455d9817b052f0690e58d1ac7d0e4108822ca72463169"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.11.1.tgz"
      sha256 "8c6993c3515f18f2a2ad0f598fb3bc98af9578836de6b7968083edf868e92b0c"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

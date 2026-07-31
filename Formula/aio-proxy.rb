class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.1.0.tgz"
      sha256 "c2a2468eb1a69180fb18da18714af9e9b7a929e4e53d5422a98bd3460aa6f201"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.1.0.tgz"
      sha256 "bf4a771719869b3e4e2559a93f821bdb5c7e751fe6a497cef7a57f9e03455482"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.1.0.tgz"
      sha256 "e395b3615efa34b189bb3a27f779481e1d867825252d694afb6d99922d1e6697"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.1.0.tgz"
      sha256 "19262f01a43d504c9bdbe7c9700492503bee04def8a6387033c8ac2ebc66dea1"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

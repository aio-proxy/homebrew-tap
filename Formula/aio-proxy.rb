class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.4.0.tgz"
      sha256 "35a1297129c207c3f638c1b1901ea7b6e9d56a72ffb7e2bd32379b0339ee8ace"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.4.0.tgz"
      sha256 "fff8d7905d92e5b7f986011b2abc7f08df07d8bd5fa481fc92f7dfb68467e7b9"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.4.0.tgz"
      sha256 "adf12ece428fee71d383ea93e549856398f4ecc7e63cf2c8dca0e5bdb30d241b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.4.0.tgz"
      sha256 "c5b278d469dce0d472f475e3eb138fc450171f3ae4536b530be15a552df72a4d"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

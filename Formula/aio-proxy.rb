class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.6.4.tgz"
      sha256 "7868872c1131bf0094a9a4d8543749612c7e4e1200493c0994fbd84509c854bd"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.6.4.tgz"
      sha256 "a959996d60772015dd84e1bf645d2048cbe5ba6f5d02a464fc5e85b182550480"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.6.4.tgz"
      sha256 "bfd3501fab6032d58a64235d33355e6b8cc4e6e746bc733523bd11ffe3c64385"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.6.4.tgz"
      sha256 "f59e5a981398ea220b08d5963a9ffa38e67d2c1f115d2c55085aeedb5d604a70"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.5.1.tgz"
      sha256 "c064de5fc3958eaca5e19eb2a6cf08fc34ae811031a211d23ae98554bdaea126"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.5.1.tgz"
      sha256 "0292e756c1a0a5674990648040870ebc3b2aa370839fe0a16eb69fb4dcc9eadd"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.5.1.tgz"
      sha256 "8aa411c007e05cb2e0861dd1bcbb6c1fafcf906e876797e67d0747b78b56d14a"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.5.1.tgz"
      sha256 "4f563e37e6ce6de120eea37ae4b16d7ae20dc9cda1777b11e9815aae306e97df"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.14.0.tgz"
      sha256 "c2bdc5ffb2f3615105f9ef68a50ba8ec64ee633f37fa47f637d773e58d2bfeaf"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.14.0.tgz"
      sha256 "fbef409df7d2958e24f0e1bd1db8cc1edc01a69a385a0961dfba3f2f0c85a06f"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.14.0.tgz"
      sha256 "e6120e902e6851be3a13eb97b3b49acd7441164fbb9285e16ef926185f54eed9"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.14.0.tgz"
      sha256 "7477fab427650cf3ddcdf62a933c340f10692cc1ac9841028259915bddf9a6ba"
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

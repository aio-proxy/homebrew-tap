class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.18.0.tgz"
      sha256 "0d612c6ca1b6a55ff927a67c44583b12b53f1f6a8394665143bb1b585c3c0787"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.18.0.tgz"
      sha256 "55235d90a02191b2b210bf17470777809a8b0fd9dfdbd9f97c9f72476df6c844"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.18.0.tgz"
      sha256 "1d748243d9d5cb022b38c5545018358482023a9866cc266750582027fbd8ce70"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.18.0.tgz"
      sha256 "ad6c1670b489d2febdf2671a034d879d02a2152e8569ea816ded4918dac26213"
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

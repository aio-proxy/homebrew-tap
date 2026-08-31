class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.12.1.tgz"
      sha256 "d5c79d7cdc8952f0cc5e0a0f08fc98aeca4fa5ac289d7580e0a903564faedc21"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.12.1.tgz"
      sha256 "10ffed9a34742b94014ef4aea089d3d9db84cb5bcaefb2ce9386a4cd59658b36"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.12.1.tgz"
      sha256 "822a70a70ec5237294154ad9720169358b06b2ac2cd639b061cb8adcfa514dc3"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.12.1.tgz"
      sha256 "cc9086c66756bb1aaa8d5c544026093a9c38870768c0bfd72a6c65b5cf236ce1"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

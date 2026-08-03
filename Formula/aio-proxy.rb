class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.6.0.tgz"
      sha256 "bbb8dddad4a3d1a63b1bbdfd3b89ee4e44dc1b59a1e9d81e78bdbb9fe0fe4c39"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.6.0.tgz"
      sha256 "ed4ee04afe9860caefc10b0a6590e0428cd0e05955b85f0d504eca40ec83dbec"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.6.0.tgz"
      sha256 "6a3c89dce60d4b0ae603da7f538a29810d88c1ebc7100e3e87020c31577839d2"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.6.0.tgz"
      sha256 "099fe7c998812c71213252f6b92b050b9313f58ee6de6c9865136633bebbc4eb"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

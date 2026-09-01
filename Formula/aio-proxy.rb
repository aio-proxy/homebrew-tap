class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.12.2.tgz"
      sha256 "605e20911eb4cfd80aa9a16570fb978038486ccfad63b5bf3009d054c20f1ca5"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.12.2.tgz"
      sha256 "4566ef6bc5fde933fe604be2018b84d23fb7da4bdb2c2a14d1830f4fe98e79cd"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.12.2.tgz"
      sha256 "6a73923db4a855dddaace47913780e445d15010a8c962c3c1ad374267b8ce8e6"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.12.2.tgz"
      sha256 "74f477e008769b6e0127077403d6967163c3f9b2eaa8fa5983180dfa1ea4b89e"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

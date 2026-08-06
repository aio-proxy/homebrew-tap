class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.6.2.tgz"
      sha256 "684ef13a9462f81a2ca6e66de12424917b4510b80737005e4f00885c6f6a6649"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.6.2.tgz"
      sha256 "61c93bafb073f30b1e766808cd25957037fe31ae2623004956b4be45468e556e"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.6.2.tgz"
      sha256 "de3b17263d5bb1aaebb24aabe9ba4e002139396adeda2c95d2f6ed6591ff6700"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.6.2.tgz"
      sha256 "388e6063e01d3da6bb22a15365bda90355ca55eae262a6aeefc1d1003175fc8e"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

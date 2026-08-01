class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.2.0.tgz"
      sha256 "083239514b0ec839fd222f27a721d802f006c6fe2a9954449fd24f2f0671ef77"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.2.0.tgz"
      sha256 "64f6857c8ae90516ffbdd7c62cadeba039c2f48f4a392e23d157f75d54fb3170"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.2.0.tgz"
      sha256 "db8cd8a93208bab7f48b61f47ed597a2d09c8d080fcf4dd922170701b62e104e"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.2.0.tgz"
      sha256 "7c08007a84c10e64de4918cc93c8ec14536d942754289ae27d6b83dbabfbe0c7"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.7.0.tgz"
      sha256 "a07943deb0944dca6bb82565160861276146034d561eb143ad2c4a3fde2d46cb"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.7.0.tgz"
      sha256 "ae2088e4a31bae32113f9fe564d6f8e83b94084e55c52b5d5c0485e04c0b4fa6"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.7.0.tgz"
      sha256 "babb823015f2f294d5676c5b64a216d6fcfc2664de9655e7270945d43bb5634b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.7.0.tgz"
      sha256 "6c53b3672abc19b57d76fd40c966a83da3bc462e32d29a1e415bb6e192b2f35d"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

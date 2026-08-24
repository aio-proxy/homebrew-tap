class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.9.1.tgz"
      sha256 "137b88e2ece18b1b30c33e6daeae9319d5dc164cc1faea3cbf6c77e34bbe5cbe"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.9.1.tgz"
      sha256 "90ad75ad5d8ff35714c8d4df78f9bfaf06eac30cefa8fede368334a645e0d5dc"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.9.1.tgz"
      sha256 "9e99fea3ed469e02d807312fd107bd41d47539804da511fe8a519827b6891675"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.9.1.tgz"
      sha256 "2084f6d926eb634bf6170fab75a24093f697013c2d274a9a777741f8a01bdff6"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.6.1.tgz"
      sha256 "bbc8d4be106d942dd40b219648f7bf2eb8a19436fd6db190aea91a831a69794f"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.6.1.tgz"
      sha256 "70a239a4ced5acc021b416415f2170cbbf09d10e38dc9e585081726f1253ace9"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.6.1.tgz"
      sha256 "fa274c3768a94e9e3733c789de3dd4bc77dcff8f5f4248e5c4752a271bcbeb2b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.6.1.tgz"
      sha256 "d081ca26a60fafe2503d5fa979cabaf9d2c83fb2f69f15a33d3d0d931340d6c6"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

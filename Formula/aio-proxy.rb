class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.11.0.tgz"
      sha256 "e912a174436586f6badc33f187790e16d3eab35b56e51d247c15f5c32daaaef5"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.11.0.tgz"
      sha256 "1ee12a4487c3f8d06a6a5146cc2348983e36f2f06d0b5ce1f311c0d29912a21c"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.11.0.tgz"
      sha256 "6dfc417b22ae37af6aa297379f4bddd48a84c88e42af2d2e7037e981f4e62020"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.11.0.tgz"
      sha256 "9cc01b087a7ad0e51c31da62342087a5635fbd08f8e6092d7140f13ca34b000c"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

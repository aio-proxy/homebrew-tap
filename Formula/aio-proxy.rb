class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.0.1.tgz"
      sha256 "00f6557364bf90f76b2e0255199aee3751479f0db8df0e1815bc77e34839ed8d"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.0.1.tgz"
      sha256 "47e21a267a1dec458ae03a78ea18f1d949ceb010ad8accad5c773c65e3a535f0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.0.1.tgz"
      sha256 "cd3d02db88b33f5f4d5a754477f1f002bf05d6228f9310ea7a8a11bde6124d67"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.0.1.tgz"
      sha256 "58bd7592edabe38d7855661bde6d1313694e5a88e3a2c83f6fe3536ccb2914d9"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

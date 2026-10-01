class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.37.0/cli-darwin-arm64-0.37.0.tgz"
      sha256 "95a5a02db3e25b05f97b1f6abace6448dd289d43445661f51d28c350e4366e56"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.37.0/cli-darwin-x64-0.37.0.tgz"
      sha256 "efa84acb5fbd7fa28c713706a9487806d02edf4d794c1d7400a4c4f36ffa3cd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.37.0/cli-linux-arm64-0.37.0.tgz"
      sha256 "438815056a42e4192d7ac3e2f7d180d5e4eb63ba4a398dcab64a6f4e4db951c3"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.37.0/cli-linux-x64-0.37.0.tgz"
      sha256 "8941a1102ee8f8595ad10ddcd614875c68863b90f7787aaf8e1d4ede634af0c1"
    end
  end

  def install
    bin.install "bin/aio-proxy"
    bin.install_symlink "aio-proxy" => "aiop"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
    assert_equal version.to_s, shell_output("#{bin}/aiop --version").strip
  end
end

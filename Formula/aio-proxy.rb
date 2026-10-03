class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.0/cli-darwin-arm64-0.39.0.tgz"
      sha256 "f885c8c2384105512446d3397529e4e4ac9b4b43838d91e065e7f8dea7e25860"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.0/cli-darwin-x64-0.39.0.tgz"
      sha256 "e932351a57d5375737126ba3c9f9ea3e540961836bd972094c4b1648a7002dd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.0/cli-linux-arm64-0.39.0.tgz"
      sha256 "7220082028d8595562dfbca2ed536a17a685f6f1e6d8d6e9ef22092d2d05f350"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.39.0/cli-linux-x64-0.39.0.tgz"
      sha256 "bdb3ac07d1f7ad756a7b31cbed702489c9058f29a32d01891717544c18fcd3f3"
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

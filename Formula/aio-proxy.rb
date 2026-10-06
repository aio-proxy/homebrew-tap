class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.1/cli-darwin-arm64-0.41.1.tgz"
      sha256 "b8c390386351bc2c23fc27e001497222f66e584a1b2cec4c8bcf8c48c7bbaa19"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.1/cli-darwin-x64-0.41.1.tgz"
      sha256 "8c599b95b9878516357e057800f3666e9cdc5831039e118daeb5ae198655b9b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.1/cli-linux-arm64-0.41.1.tgz"
      sha256 "4c243fa91031a34b30570f9d995646bb1927185c315bdeb05a369dcb5acd4a9e"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.41.1/cli-linux-x64-0.41.1.tgz"
      sha256 "98040d4ce6e34220198a56bbd4ed8c39d73e17701ac2d4f6ffab4434b821d5e5"
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

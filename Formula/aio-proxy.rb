class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.2/cli-darwin-arm64-0.33.2.tgz"
      sha256 "3af1de99519bdbf6cd52e740021c3cc7959ccab9485e4a92a0aad5d01070405a"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.2/cli-darwin-x64-0.33.2.tgz"
      sha256 "7e73db0bd384287b0e58e8441e9857ec54d4f4052ac2955a4b2fc5c549c96190"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.2/cli-linux-arm64-0.33.2.tgz"
      sha256 "7de8b2be30904c1b06cea37c52c2f09feeb51f7d826ed76d9ef26a9d6c4f6782"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.2/cli-linux-x64-0.33.2.tgz"
      sha256 "f43c7b50f10c19cceba42996fbe4a3c42bd1f9782f7ec000d3d4f712a980cd66"
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

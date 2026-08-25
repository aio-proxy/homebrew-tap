class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.10.0.tgz"
      sha256 "d5a34c16daa4a6c85e908a3819a9b5cdc6be2741bc2295a1b63f5783469ee251"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.10.0.tgz"
      sha256 "a37a368ae03d4faeee4a453014ff14b7cfcd9771ff1e6c1664aff733426cb313"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.10.0.tgz"
      sha256 "702f436cce55a47eab37d026c04b6c81087bcc13581bb6af886ccc71d00293b7"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.10.0.tgz"
      sha256 "0cfa221ca9155fffaea762f2f0fe50d46e15f8c8cda98879699e81a4b3e8f09d"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

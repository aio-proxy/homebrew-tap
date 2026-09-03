class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.16.0.tgz"
      sha256 "3ea4dbcfb928db288805d0869a6a78746963712171284f86644925db453922de"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.16.0.tgz"
      sha256 "be9bc9410bc3507034d8064d8c52d677f7656454b7d4e273dd4ea3de3e51279c"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.16.0.tgz"
      sha256 "e92c4f1df49b5f0611144069f9ed32bc30129c3599a18af4be16d3a7e9d1a127"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.16.0.tgz"
      sha256 "0775df63833ad5710f7421490e89b0e2ed84ff9eddadac70b36405a985be30dd"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.20.1.tgz"
      sha256 "1d0c04a6a6a676ec0e7a4344d8969e5aa13038522d4fcaaab4f77061b4a27af8"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.20.1.tgz"
      sha256 "f74992bf651bf21569676c6886d6f688913cfe916258db66a4877ff8a4fceda3"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.20.1.tgz"
      sha256 "c0a1abda52665c0f29c3f7e61c089f543e40f05c66a5be32794003236335621e"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.20.1.tgz"
      sha256 "394aec2c436aaddbe1669f667be74dfd348789dc05db444423c81ca34ecd0e15"
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

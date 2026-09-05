class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.19.1.tgz"
      sha256 "0238f8f8d7c9bcb9abd2a1e2e53f71160c4de36aee58971d0f77f543eca18b40"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.19.1.tgz"
      sha256 "5b77dc06af9bca086be7fee12789af911420733cbf36b2904d37ea55f9660704"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.19.1.tgz"
      sha256 "5bf89ff0b3851e5313297e8f581754b343828836e392e185b21243d47f251af9"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.19.1.tgz"
      sha256 "54354e3a02ab6f17abba073808bef0d7f706225ceb2bf4bc966373c85a6e2190"
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

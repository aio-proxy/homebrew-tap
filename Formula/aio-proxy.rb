class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.17.0.tgz"
      sha256 "c06559bd0694bff9455cd6f42faf7d3b5493097557296447ad0bdf3c6670fe66"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.17.0.tgz"
      sha256 "8a03c2c0b8e1dd40156ae07ac6360e4f4217330ee548507efc9f71fbac2cc184"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.17.0.tgz"
      sha256 "c3d93671c231c0b8bca9ebbffe8db25d662ececfc62205394a4ac22a75d701c0"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.17.0.tgz"
      sha256 "58c0da32cf735e57a769f960fc678f2c2b2e8efda3cd4f2fe76d0c501e2204c6"
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

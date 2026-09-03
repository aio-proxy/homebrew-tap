class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.15.0.tgz"
      sha256 "091f2e875e1b580bf590aee7cfe2d879e4f1062cb6bcd3330e46e66928307bbb"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.15.0.tgz"
      sha256 "9824dae9208fb3df993e2598868bbf3726f491aa578b5ee3044d054ab70c32a0"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.15.0.tgz"
      sha256 "3e4e9dc9a86f7daa844a7d18d54b94453a810daead48f4031d5d6388521e1cc8"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.15.0.tgz"
      sha256 "a82cba7d6f6b85b0b4df3978e64388b09ab54846e474930c5524df274e633feb"
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

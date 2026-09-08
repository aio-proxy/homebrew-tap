class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.20.2.tgz"
      sha256 "bb10af7ecaed79b1f054579f1f2120d34ccc8af7b4f1e368172392f43853b9dc"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.20.2.tgz"
      sha256 "8e129f9efcd5748ee4a0f85cc8e3c9402bd48729e59bbe96f13fe60111bdd8b5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.20.2.tgz"
      sha256 "1ef9a460b9d507391287f052bf4cb695f3b3f76ac3580bf7e26d6a451c3a262f"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.20.2.tgz"
      sha256 "0c0ca076707076f8ff0a865d60843737c1a8918cd3351d1168fb0ce9d9a4a3a5"
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

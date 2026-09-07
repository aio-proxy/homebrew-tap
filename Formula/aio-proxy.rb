class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.20.0.tgz"
      sha256 "7aa3ad03dbb6396b51cd1038a079738ca18cc85888f4a574254ba82cbb555f2a"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.20.0.tgz"
      sha256 "79ecb0421050ddaf251ab7f68fe9d910e5ca834098e33959f7b9b40bdd1973c4"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.20.0.tgz"
      sha256 "6e37a2a41cffc4fea19c1e3862938279ca507a9c81eec61c121a05b990524d72"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.20.0.tgz"
      sha256 "2a5a7492fa9f1828c9ec3450ca9a34195e392c2c8497bac1ff5e51bd3db40eaa"
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

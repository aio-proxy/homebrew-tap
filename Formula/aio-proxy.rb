class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.19.2.tgz"
      sha256 "7e62e8d7a53dee1ba6eaa1ef3a1b1049a60f821263efb924afac01db7a837e23"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.19.2.tgz"
      sha256 "11f666bfc0478c1783bf0340dfd00f6f0418c88578f1c489a7f0562fe3b10102"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.19.2.tgz"
      sha256 "ea79393444bce626996aa359fd570a08dd9df9e07d877e4acd895b9edfbedebc"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.19.2.tgz"
      sha256 "01c5713eddaf660e92af4885c5f7093e0ba74750d2850b33dee126c24f3f39d7"
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

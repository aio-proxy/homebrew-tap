class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.24.0/cli-darwin-arm64-0.24.0.tgz"
      sha256 "fc5d99fcdf6de38011ee5ffab2fa9dce7ace926b0c2fa37a806cf69b8b2134df"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.24.0/cli-darwin-x64-0.24.0.tgz"
      sha256 "2fc685e83c6a60767a541e825c5585b0c534131d160a3dce935e39a091f94d7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.24.0/cli-linux-arm64-0.24.0.tgz"
      sha256 "c2dd4e46eee83c258964e20d0ec7754f527b4863a1be533da511ea03a6356241"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.24.0/cli-linux-x64-0.24.0.tgz"
      sha256 "bf3e6e89785aa942f1b34cab8238eb9d1c6a990fc02ff7ea4fd10f5b7b8ea620"
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

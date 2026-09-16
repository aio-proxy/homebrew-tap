class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.2/cli-darwin-arm64-0.23.2.tgz"
      sha256 "91849b7c704bcbf29d556914217c3451023cfd5b964c45ec61084e60b712cf7d"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.2/cli-darwin-x64-0.23.2.tgz"
      sha256 "0e90aa0154067c499ae3f7e202d8952d02a7cbc184ba93e85bfc9449a2a2bdde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.2/cli-linux-arm64-0.23.2.tgz"
      sha256 "8e4be905bd914c579ed44c5d2dbb3d1addeff8b8c828f1a7bb596bfcd26d57e1"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.2/cli-linux-x64-0.23.2.tgz"
      sha256 "5b548cdb269717a597d0e9e0aba37138b35a7f931fe27be83c3ef7cf9d1b37a7"
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

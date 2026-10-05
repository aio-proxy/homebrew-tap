class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.40.0/cli-darwin-arm64-0.40.0.tgz"
      sha256 "e379ffd562cc24906b96f7fef1924783516cc77bc06ef830ced2338d1218d3b9"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.40.0/cli-darwin-x64-0.40.0.tgz"
      sha256 "93d576bf3ab0e37c3c4b2265e35d3f43aa2cb7d55b90f1e730c716379ef9f1a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.40.0/cli-linux-arm64-0.40.0.tgz"
      sha256 "a48b7c4d7df7cb8fd1337bef23d107eff8316d57d38f1692349b3f6efe5f2ef3"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.40.0/cli-linux-x64-0.40.0.tgz"
      sha256 "3174a266fcc79d595a1482bb54151a054be8a8d603d36fef18253886276cb413"
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

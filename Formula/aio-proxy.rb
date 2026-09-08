class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.5/cli-darwin-arm64-0.20.5.tgz"
      sha256 "4b97673f56114c8af94141f4183148eed4c0bdc5494bbcaf1ad9bcf61003c349"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.5/cli-darwin-x64-0.20.5.tgz"
      sha256 "f33620f69f9063d662367efc7cfc35674d485bf47a71e2884f2a179b9d1ee8f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.5/cli-linux-arm64-0.20.5.tgz"
      sha256 "a22f99422a841c44d26d72827bf6432d1a14633965f243a9e2df1c571169e7d7"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.20.5/cli-linux-x64-0.20.5.tgz"
      sha256 "7913a3f0e8835843ec47d53d07e1b4348faa57ec3c5de83660dea69354e81ad1"
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

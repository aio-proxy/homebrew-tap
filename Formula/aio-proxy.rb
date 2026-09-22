class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.30.0/cli-darwin-arm64-0.30.0.tgz"
      sha256 "8a07a5833cff2259cf1069ac62a1756e522e2f53c32eacbd681068fa9dfcaab4"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.30.0/cli-darwin-x64-0.30.0.tgz"
      sha256 "4a763ace36f3f5138e29a7867d76f6c85d412e69ea8b6fe72f8cac553ad21aab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.30.0/cli-linux-arm64-0.30.0.tgz"
      sha256 "741dda49972fa9d5a07c5fb8adde499d17ef892e20ef4f2cca8aa7f112032e58"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.30.0/cli-linux-x64-0.30.0.tgz"
      sha256 "8c76f98d8bab1934076994b91909d996100885ef663ffd474b1cd55207995bf9"
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

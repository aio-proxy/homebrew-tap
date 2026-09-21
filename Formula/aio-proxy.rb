class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.28.0/cli-darwin-arm64-0.28.0.tgz"
      sha256 "c0e8e66d3151d66c19bb2a4454b39889b7b3ceabdb54d46ba459e9d2d52aaf7b"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.28.0/cli-darwin-x64-0.28.0.tgz"
      sha256 "ea797e1be1b4bfc99c9b3536af3a4bd195b3bef318cff249b0da6cfbb111be0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.28.0/cli-linux-arm64-0.28.0.tgz"
      sha256 "e6428ec28b16c0d8ba6b16a72f96b017f3dc893db40d657fe49918df28c9fa31"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.28.0/cli-linux-x64-0.28.0.tgz"
      sha256 "a4555af3f6cc13d3fdc5598f497e7ee3b1afa6df346b6045aad4768e07cb3fb1"
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

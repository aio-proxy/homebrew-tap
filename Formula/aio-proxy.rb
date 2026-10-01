class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.1/cli-darwin-arm64-0.36.1.tgz"
      sha256 "2865cbff8d233e7a37a3051aa94ae1c5ca575d9f981c69f16db7fc3d5bc5fed9"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.1/cli-darwin-x64-0.36.1.tgz"
      sha256 "8365f76b221c1dd0356ce70ca83ea7a34da38769d5559b1f237c558854387fde"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.1/cli-linux-arm64-0.36.1.tgz"
      sha256 "46d005881e652e886d27f79930e6da627c7bd2deff93d5e1f5a470bbbfd7e1f8"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.1/cli-linux-x64-0.36.1.tgz"
      sha256 "d2b7746a748f2f01448c1c19f0c513c530f73210f326a91b1f5a15f5beb1eeeb"
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

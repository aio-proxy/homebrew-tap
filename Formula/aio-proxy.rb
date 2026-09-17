class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.25.0/cli-darwin-arm64-0.25.0.tgz"
      sha256 "19dd79f4923bb365940ea4318ea6522458bcbcf8bf6167245a56686cd0552368"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.25.0/cli-darwin-x64-0.25.0.tgz"
      sha256 "919e1c2436c0070f689695b44152f83d806beb6b9883aaaded4020022ac73ac1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.25.0/cli-linux-arm64-0.25.0.tgz"
      sha256 "400b9a50355726b2b7e5d0ee2f21d065a8aadff09f37eff275a9655375bf042c"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.25.0/cli-linux-x64-0.25.0.tgz"
      sha256 "1016c0c4b48cb953776251fa2d6c476b5208b6c156a6dd9f1c61553ba2bc85ff"
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

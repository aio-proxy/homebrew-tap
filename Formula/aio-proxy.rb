class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.11.2.tgz"
      sha256 "f67555328ce23b5a83e0ec23bba0feb71f6b7ea36de6f99d56c462622956277a"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.11.2.tgz"
      sha256 "76a4456b1e81004be7146231e6778336716348138d0b36a057c08fdf0d744914"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.11.2.tgz"
      sha256 "7bba518194183cae53c3759881168eb42ae9b76963b4510949118c275f674297"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.11.2.tgz"
      sha256 "c89ebd197fcd3e222374c96a831b35876e0728d2cf348c761fdfb9879d2de6c4"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

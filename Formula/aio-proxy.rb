class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.1/cli-darwin-arm64-0.27.1.tgz"
      sha256 "4b5c2e1a70a591f89ffa8d3794975f49a61911bd87d0aaab630d956a632aa57c"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.1/cli-darwin-x64-0.27.1.tgz"
      sha256 "cf5b2d75c1c60a4efd0d3cf46b5735129bcc823fa661869fbd13ec4a70f31b27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.1/cli-linux-arm64-0.27.1.tgz"
      sha256 "5d81620e65896245e171bf1c851dd97556ab9777d88caa81026d4669f70732af"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.27.1/cli-linux-x64-0.27.1.tgz"
      sha256 "6b4a5eda24aad7c39771452c7a95617014e535b0983042ae24376de60e4c3cf6"
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

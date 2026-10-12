class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.4/cli-darwin-arm64-0.42.4.tgz"
      sha256 "a9e243392da797c472b678d8a0088ceb1487f7e9f96da618a41059d778aeb2e9"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.4/cli-darwin-x64-0.42.4.tgz"
      sha256 "582f3f8f1f9f551ba2106353f1f9b4cf69fc6b8eba5ccdeb60aa20ba4f2560a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.4/cli-linux-arm64-0.42.4.tgz"
      sha256 "f9883d62e951c5421c55b923a31d994efa1c401ac75377b06f3cce1e30de27ec"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.4/cli-linux-x64-0.42.4.tgz"
      sha256 "1f8229ce5009c6f5c1154d1a7f1a0dc39e5b7b534d77ba460df8a306cf763645"
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

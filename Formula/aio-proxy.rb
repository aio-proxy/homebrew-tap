class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.1/cli-darwin-arm64-0.42.1.tgz"
      sha256 "157829bd03d9e359bf12bdf79c3bd11ff27bc95662f016e47878962f074c0eaa"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.1/cli-darwin-x64-0.42.1.tgz"
      sha256 "48169f26bf9c52338a6657a536947d43307bac67879c14af22dc67ef8c123b11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.1/cli-linux-arm64-0.42.1.tgz"
      sha256 "76c22c34f659b841cf70ffad546ad48496a5882a03f70ab10f42e1f277ce5f5b"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.1/cli-linux-x64-0.42.1.tgz"
      sha256 "0dc2afff49c66ed0d067d90133f7f3a6b8bab4e60ef6947c803a60be3e8bbf20"
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

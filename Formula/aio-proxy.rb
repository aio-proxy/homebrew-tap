class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.0/cli-darwin-arm64-0.36.0.tgz"
      sha256 "1625b2682dbe38840368938f02bd099b324f4f392632253aa9a2e8a01a364834"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.0/cli-darwin-x64-0.36.0.tgz"
      sha256 "a7bb580e9e5f7a4ad6d565979daca64df74bd7d9192da97d301de52ed0b98589"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.0/cli-linux-arm64-0.36.0.tgz"
      sha256 "cfca10253e4ca31eaadeccbfeb3002287d711c97da7ca9a2f85157121d36a23d"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.36.0/cli-linux-x64-0.36.0.tgz"
      sha256 "916bdd9f969542d53e596f1eaec716cc9d8c4ea76b427f079f837566cdacc3ad"
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

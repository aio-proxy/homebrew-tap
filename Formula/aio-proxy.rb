class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.18.1.tgz"
      sha256 "3a5740977462eb346222513e8c60ba5f13402f28274273c3f9324265ba361582"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.18.1.tgz"
      sha256 "3754eb2381c17390ee75532d36ae88949a8ebe30abf41a11f3871edd25c15f6e"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.18.1.tgz"
      sha256 "2153341834d4a31515a24b4bc0c4f4bdeb1be612b8be1c86af953d3c9bc9186b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.18.1.tgz"
      sha256 "ff9f10d40333ed679c6480ea10ba10480d66f46f688a6acefa8fb2019a2fdb63"
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

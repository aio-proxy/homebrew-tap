class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.13.0.tgz"
      sha256 "08a139e6c1fc49d5d994fd3ce578c3e10aea8079f505fb9d42dfaef23a1698eb"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.13.0.tgz"
      sha256 "dc2517e09c1e48463cc805380b84944f35bd594d7abecd54c4b307541ce826c2"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.13.0.tgz"
      sha256 "8672ba182a404416f37e935bff197492ddfd329865591862b53397f78a3eb012"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.13.0.tgz"
      sha256 "8b00e87f90f9e0ac28fc8f1ae4ae513e5b92e8c98bb48fdbd5567434356c3239"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.19.0.tgz"
      sha256 "24825d64953459ecaf171e95eb8b4e00c8bb398f633fdf33094eaa46b587f2b8"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.19.0.tgz"
      sha256 "4f678cebd01cd872188f52dd9d21690117ef04cf76e83358760ec806a3e9fa1c"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.19.0.tgz"
      sha256 "24e0f8f5b93bc0fec2b85404cc81efda34ab02ed90cc0eaebfaa6113fd28c5eb"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.19.0.tgz"
      sha256 "4820eabb23e9c528c51747563a43da77acefd2b6179420a238cc16e432099d74"
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

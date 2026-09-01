class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.12.3.tgz"
      sha256 "b9e0152427ecda87a02e64147e4f8b6f267ea6bc225fba40db584669a32a31ca"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.12.3.tgz"
      sha256 "fca32dbc79448e3570bafea87f7356f14722dbf56d7d77d3c689ab6d63bd15c8"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.12.3.tgz"
      sha256 "0b2acf74df4bae4a6346c62ad304f472902c64518eed2e11e8ac9767ed1c689a"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.12.3.tgz"
      sha256 "a08ab2483c4c1dae263388839d471fbc69fa63c14d82bfeef813b01ed90facbb"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

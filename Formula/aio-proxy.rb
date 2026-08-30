class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.12.0.tgz"
      sha256 "fa74090c9e54577591defd64190a3780bd802b1ecbdb7e5fe2d323f093330669"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.12.0.tgz"
      sha256 "8a981e84b6a5ae98c7e13262bb6710d24a276b4074370ac4aaf4be639acd1e49"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.12.0.tgz"
      sha256 "96f3383c0d5198829bdb9c3fa0b59e35378a1f5fa19506978157a34fa204e0d9"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.12.0.tgz"
      sha256 "f975ddd1de2fb8275ac56417db0334b335adc9cd8eb8be2072b90ef80ed11181"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

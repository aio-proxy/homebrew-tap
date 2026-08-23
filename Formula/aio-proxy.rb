class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.9.0.tgz"
      sha256 "a9277b8ce547a976b328c804d63b10471477625263ebbc82b9b96d0146fa29ec"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.9.0.tgz"
      sha256 "e37be5fe29be617b1d70a2608475f6dcf3fe81964215bdd3385c3068796a6a08"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.9.0.tgz"
      sha256 "4470bc70cf319986f25249a0a723f2ab2731abc3382cf26f0a90d7f753409e2b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.9.0.tgz"
      sha256 "932668c7c5e35388f8c1094bc8040e5dcfc55cccb11fdd64305482c770ef0d3c"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

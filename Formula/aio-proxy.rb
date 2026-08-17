class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.8.0.tgz"
      sha256 "2d07ae9dfd830fd075989d6d63f52571469baf0a8a98ccbaee01b3f84d7f4ca7"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.8.0.tgz"
      sha256 "a9107690d09ab6fb60c66238d60db6b59849c3bca54e731992725a03c3397972"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.8.0.tgz"
      sha256 "1d65d3bd5f89d86bed28869efed138c5c62b26c73cd3108b32d93fb7d414003a"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.8.0.tgz"
      sha256 "d5e64dc6cae060e235c35c26b8afbf1be3513834b4e4a0b51bda8b8dbdf2d768"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

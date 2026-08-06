class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.6.3.tgz"
      sha256 "dbb97f54e0bad93c1cb03afe2f83f6ec4c2b6a4480034a7a69fa00f880127d24"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.6.3.tgz"
      sha256 "6ed9cf00958d247c3992a10d6c6801c3e80feebbd46fa43df79ee7b68ffb1ab7"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.6.3.tgz"
      sha256 "f7dbc24b2f8e81769d22de18e53e7c8c22b2d979c249f80d7fcefbfc632c7755"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.6.3.tgz"
      sha256 "fe7d2f8b495c0a4e98e0aeddae517bc41079afc33bed737bfd32f92bbbb75b14"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

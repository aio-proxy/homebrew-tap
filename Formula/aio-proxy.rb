class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.5/cli-darwin-arm64-0.42.5.tgz"
      sha256 "f6e907c48ec162c447860eeb9051bca960e8590689b7f01943c4703535d325a2"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.5/cli-darwin-x64-0.42.5.tgz"
      sha256 "fb58ec77d8a9a413aef4a9d85642920378e65cb0e76d11433595cfa0c51e475f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.5/cli-linux-arm64-0.42.5.tgz"
      sha256 "463b952507ac8744c96e7c188d1ce152104c48cea767799f26fde9d89afaaf1d"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.5/cli-linux-x64-0.42.5.tgz"
      sha256 "0fb372218d3171de371e8252ca501ffb373fe99950abccd25df9508b92f8dd32"
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

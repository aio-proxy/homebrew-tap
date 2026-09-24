class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.0/cli-darwin-arm64-0.33.0.tgz"
      sha256 "1753e9fb4573d14884d962dc862ac97be93b5f1b2191f751ebb83ca5ca367ec5"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.0/cli-darwin-x64-0.33.0.tgz"
      sha256 "547d7e06d9cc5485a26d7343de3752e074f3a30cfb7bcbcd5b699bd36c2212d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.0/cli-linux-arm64-0.33.0.tgz"
      sha256 "4c8d440d1d02823faad61f6f2230f32ea130aa30e40f2ef426343044651537a1"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.0/cli-linux-x64-0.33.0.tgz"
      sha256 "e09bf0e0583953f2dd8c3a01ea2e4682739b682e0a0dca7e92eccd0bcd3983d2"
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

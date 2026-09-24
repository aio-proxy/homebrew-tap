class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.3/cli-darwin-arm64-0.33.3.tgz"
      sha256 "478e2843e67f330b57677078824eebdad6466069c0ce390531381de0f1b12b8e"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.3/cli-darwin-x64-0.33.3.tgz"
      sha256 "c574341327a252ff2e8b0e4030b021ad8e3ac6cb993651aca97eb05277d67577"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.3/cli-linux-arm64-0.33.3.tgz"
      sha256 "d6c94cb06b2c587c22848cc8567cf79348d4c5597494a3ff814369b4db0359aa"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.33.3/cli-linux-x64-0.33.3.tgz"
      sha256 "722448eab3c7709b16d03394958a8d8e8745d0f77939942a59ca3685a59f0ea9"
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

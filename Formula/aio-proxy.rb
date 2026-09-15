class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.1/cli-darwin-arm64-0.23.1.tgz"
      sha256 "9c10e6f8ba66bddc20601e017be1fcbd8fc8b3bdffec2d32e45b15a11a295e5a"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.1/cli-darwin-x64-0.23.1.tgz"
      sha256 "c383873c9d434bb0a761fb90f6e7a6cedae19aada33d27c4fd3e9844fd70890b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.1/cli-linux-arm64-0.23.1.tgz"
      sha256 "fe8a4f136761e0e10d4204150bf4fbb8c12f022b1e70f9d99047b850ce147fe1"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.23.1/cli-linux-x64-0.23.1.tgz"
      sha256 "6ff8da7dfe6cf6892b288b2e7733a6df2a5963d4f872f6cb71a4185a2c64b0a2"
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

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.21.0/cli-darwin-arm64-0.21.0.tgz"
      sha256 "d6eab5c929b60073c4c45b1af7e56503da13d4b7e60eb552d019dd8da6d74905"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.21.0/cli-darwin-x64-0.21.0.tgz"
      sha256 "e0b927dad65c9d374e080512e84e3e2075e4e368c04e6f38b76900e7021f41de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.21.0/cli-linux-arm64-0.21.0.tgz"
      sha256 "c3dc7934a3a0e2b73ca0f862c69dd72fbecdc8a0ab44578da39b5eedd1f3f2c2"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.21.0/cli-linux-x64-0.21.0.tgz"
      sha256 "40ac0a244a984623442633aecfd382b67f67b88f4ac29f39b7ba8a5700cbf84f"
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

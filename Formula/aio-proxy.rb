class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.0/cli-darwin-arm64-0.22.0.tgz"
      sha256 "0210ae7455709dbd48457b7cab4752d618b6b7705fabe92f22cefbdaa9e6e438"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.0/cli-darwin-x64-0.22.0.tgz"
      sha256 "ff3de25077987225860c21ad44bedb5b45640e29407dc3688856bf71fc496252"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.0/cli-linux-arm64-0.22.0.tgz"
      sha256 "34dc01bd7ede638d6f0f3d77c8d92296400ea8020b61a15fe4633a4a8c2ddf7c"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.22.0/cli-linux-x64-0.22.0.tgz"
      sha256 "4fd4bbce1ac6348692f82bc2645c6b550cc061d9cf13bd22c3413f65eff49cff"
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

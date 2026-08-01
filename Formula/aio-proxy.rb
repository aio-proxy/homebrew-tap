class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.3.0.tgz"
      sha256 "c45c5b6db0d98acd77a4e7831e512a567cfaa05a98014036da64afcdc3ec1ae6"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.3.0.tgz"
      sha256 "c316ca1c995b33d2cbc8509380fa49f02befc0dcd399886197cb9107a8df17f2"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.3.0.tgz"
      sha256 "754ef5a79994257a46054f831351f9bcc2820bbce8b21df75262ac4306f44631"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.3.0.tgz"
      sha256 "f82368610331f5ab656f8d66cb5d114bc1d1f05b8faea0f51e5453d1d73e8f65"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.2.1.tgz"
      sha256 "d50a6dc4639bb6e6e2c662be676e4b4a76118985c75b606d725dd977e33bd890"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.2.1.tgz"
      sha256 "03273d1de3a229fbe0175748477382ec4c06ecfdf178a02bb0814244627db9c5"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.2.1.tgz"
      sha256 "1fd5b644f6a1dbc35a7fb1b7bfddd62641494c65439702d1c627b3da83842cb8"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.2.1.tgz"
      sha256 "49c90aa221e859d83177af8acc4407b1c217410fa1aa34faab02d90b8143b5e5"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

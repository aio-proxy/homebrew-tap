class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.29.0/cli-darwin-arm64-0.29.0.tgz"
      sha256 "8956999dc8a9a5eb56170de8f6f99512131ea6718e04ddb94d6b3cef81027054"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.29.0/cli-darwin-x64-0.29.0.tgz"
      sha256 "561afdddbee0e9e1e75217b8c1c3239594f7e561d206105525390913fb4f37dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.29.0/cli-linux-arm64-0.29.0.tgz"
      sha256 "ea424e43a70746f30b359d0e48a84567d7207e1ddedb045b524059997aef9f07"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.29.0/cli-linux-x64-0.29.0.tgz"
      sha256 "0698a0b257efa3a9aa5450e7e410966c37b28a08e85cdb911ce1f60074afae06"
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

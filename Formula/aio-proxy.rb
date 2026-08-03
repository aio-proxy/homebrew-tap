class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-arm64/-/cli-darwin-arm64-0.5.2.tgz"
      sha256 "f8ca18366f84c50760e92a9d889858fe89eb8bfffa7dc35c1030af8ede29be9b"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-darwin-x64/-/cli-darwin-x64-0.5.2.tgz"
      sha256 "0e07c6c4767b79a92a20ae230f46ec4c9088b279aac414f63746a8a881aecfb1"
    end
  end

  on_linux do
    on_arm do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-arm64/-/cli-linux-arm64-0.5.2.tgz"
      sha256 "e6536a61f8df280193726da27f06884c439f4351315b60c31d47416070e9a3e1"
    end
    on_intel do
      url "https://registry.npmjs.org/@aio-proxy/cli-linux-x64/-/cli-linux-x64-0.5.2.tgz"
      sha256 "441e57923a4f956920b2c680344e2483b92bfab21071b2a0f960c862fceb6aa8"
    end
  end

  def install
    bin.install "bin/aio-proxy"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/aio-proxy --version").strip
  end
end

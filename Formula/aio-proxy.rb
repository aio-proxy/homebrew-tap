class AioProxy < Formula
  desc "All-in-one LLM API proxy"
  homepage "https://github.com/aio-proxy/aio-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.2/cli-darwin-arm64-0.42.2.tgz"
      sha256 "e9f9decf888958cd62ae9d37afa9e366fc3fb2bc23d9e590f67186aad5574b3d"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.2/cli-darwin-x64-0.42.2.tgz"
      sha256 "1843a597d54e4912e12e09afb308579245398bd937b1bd215235bcb33bd28e60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.2/cli-linux-arm64-0.42.2.tgz"
      sha256 "43dd6f5223613636c7611f36b68f4c95f9e661497832485534706147ff7d7d55"
    end
    on_intel do
      url "https://github.com/aio-proxy/aio-proxy/releases/download/v0.42.2/cli-linux-x64-0.42.2.tgz"
      sha256 "2f1ecb257741eed1c4603e44fd7c7ea4b73dd85874a3349e4a84d66363e69909"
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

class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.4/gerry_0.7.4_darwin_arm64.tar.gz"
      sha256 "7111b41c6f2c606c8b9d37f242d841670db01961262ffba2b7e77695c23a0452"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.4/gerry_0.7.4_darwin_amd64.tar.gz"
      sha256 "78aed44d952e9a242645c973d59c3b1e5ca3725e80b479cbde1ba7ef67bc5b7b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.4/gerry_0.7.4_linux_arm64.tar.gz"
      sha256 "d13b82d1408992e25cf38847c3ab0fcb0a8b7bfe4f457aed68d8bf3f0b8197c5"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.4/gerry_0.7.4_linux_amd64.tar.gz"
      sha256 "7646cf9d6ef25d775cfefadc83178b189805a0f46db745b9622bc24f0b81293a"
    end
  end

  def install
    bin.install "gerry"
    generate_completions_from_executable(bin/"gerry", "completion")
  end

  def caveats
    <<~EOS
      Start the daemon and wire the machine (reversible):
        gerry service install
        gerry setup
    EOS
  end

  test do
    assert_match "gerry", shell_output("#{bin}/gerry version")
  end
end

class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.0/gerry_0.6.0_darwin_arm64.tar.gz"
      sha256 "083f290d8e974cd32342eb87ee615549c4fe8094b4cc344c51e81e6b4c99b37d"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.0/gerry_0.6.0_darwin_amd64.tar.gz"
      sha256 "ce878d75fe53c3dba5af1b9f306b78d7e96737230e5d8960a7674e577c14adb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.0/gerry_0.6.0_linux_arm64.tar.gz"
      sha256 "a1965e61b74f21e88dca85401cb2a8409efb3946782fb8fb70ee7e94556623f6"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.0/gerry_0.6.0_linux_amd64.tar.gz"
      sha256 "ac75421b0a5f45e4cb517b194a5d04b873a5c5af95d778d0241343cee4f00a12"
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

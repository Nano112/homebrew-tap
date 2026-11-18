class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.1/gerry_0.9.1_darwin_arm64.tar.gz"
      sha256 "8bbacf4f92c7150a7c2bb1f4b82cd2bf2afd9459c6b48dbdaa9c1be274f49cbe"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.1/gerry_0.9.1_darwin_amd64.tar.gz"
      sha256 "ca0d4b29188042fd774225c5119c25ca3d780ef86b51ef8c20e81923f0b0704d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.1/gerry_0.9.1_linux_arm64.tar.gz"
      sha256 "d43763e7960d617a1cbbff02555063fdca36e2c5b390896fa912a564e1d46094"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.1/gerry_0.9.1_linux_amd64.tar.gz"
      sha256 "ac3077c3363bac1b50a8a7c69386c36c3a546507c0b89c1ab8e5a43e6e0b8dd2"
    end
  end

  def install
    bin.install "gerry"
    man1.install "gerry.1"
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

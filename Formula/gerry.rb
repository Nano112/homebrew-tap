class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.0/gerry_0.7.0_darwin_arm64.tar.gz"
      sha256 "8881da4d285b4f4c49be7a3e67bc7ab3475c49588e07f6c82e9ee882f67bd603"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.0/gerry_0.7.0_darwin_amd64.tar.gz"
      sha256 "c19e802481aba2a6e9b42879135765515f53284f5a292c2bd48860be110df3b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.0/gerry_0.7.0_linux_arm64.tar.gz"
      sha256 "6e24c2188f7ffa432e7972b9d092c317728a39b6a716f4721105ff5bfd89d6a7"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.0/gerry_0.7.0_linux_amd64.tar.gz"
      sha256 "3fd964f9fe092f0d6c7f86c58401fcec21c0dbb24daeb926750da3f8f1ac426d"
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

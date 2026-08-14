class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.0/gerry_0.5.0_darwin_arm64.tar.gz"
      sha256 "9aa7f7455aa8ee68a793ec7850c567f6b526707ba65c3d341fba6551d9ef032d"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.0/gerry_0.5.0_darwin_amd64.tar.gz"
      sha256 "3e5e3d3048368a42531f513df4a207f99a3c1ec47e6bf56fe6423184301f2a7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.0/gerry_0.5.0_linux_arm64.tar.gz"
      sha256 "e7d36900d59b52566cc1786da959e207a436f6f6d93e3adb89e0dd43ab03b28e"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.0/gerry_0.5.0_linux_amd64.tar.gz"
      sha256 "ee5358138cf9e5b36e84553c636c6795593dd392faee67bea9ec45e76fdb0b1a"
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

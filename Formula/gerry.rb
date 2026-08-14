class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.2/gerry_0.5.2_darwin_arm64.tar.gz"
      sha256 "25ec048f6f05ee886ecc7dc0be26cc55eb491733c69439de4eadbcfeb4445d8a"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.2/gerry_0.5.2_darwin_amd64.tar.gz"
      sha256 "06904c64718458c8d64d5c81b24ff96c87fa9dca66a12aa4f5dc75732e3238d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.2/gerry_0.5.2_linux_arm64.tar.gz"
      sha256 "f96fa7ae9bff6f0bceb03d0c045ad14ed006b7341421d57d5107556348f27715"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.2/gerry_0.5.2_linux_amd64.tar.gz"
      sha256 "0caa45a3818c61444d4db120f1548670a3c0eec0b0a08befe8f7483d5c440169"
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

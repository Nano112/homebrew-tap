class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.5/gerry_0.7.5_darwin_arm64.tar.gz"
      sha256 "84df7460cf160a9e99f2df02b4938a544643f618f411d7484badfb7a2639bf7a"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.5/gerry_0.7.5_darwin_amd64.tar.gz"
      sha256 "2a8dfada43538419293d5362c315f9698e134f13923c0f9a8b993b73cb02bbae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.5/gerry_0.7.5_linux_arm64.tar.gz"
      sha256 "7479387e9211e80b3c8747b3eabd5ae1b09c271df8b1c4d013e32429fcc951a3"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.5/gerry_0.7.5_linux_amd64.tar.gz"
      sha256 "3bd7bc8e0df01963b5cae48c040a1f7af48d29d4383b27457df32b945f03e1c7"
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

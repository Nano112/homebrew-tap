class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.1/gerry_0.5.1_darwin_arm64.tar.gz"
      sha256 "7e4fb0892c624a0b0d2491cc7d94bc446b67c7385c0cbf71491a00da844bd4dd"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.1/gerry_0.5.1_darwin_amd64.tar.gz"
      sha256 "15ac01db94f171d91aa3ac70ee28ea64c252f182f560a23d23a98a800744dfdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.1/gerry_0.5.1_linux_arm64.tar.gz"
      sha256 "161ef1c2cab50e6f7dfa9d025e6ce5db476769cafb080f29076b36982be80a61"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.5.1/gerry_0.5.1_linux_amd64.tar.gz"
      sha256 "cc5ca6ecedc4da54720494b5b5be9272ef7b9deb826a6f0de5f6cb7016f94448"
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

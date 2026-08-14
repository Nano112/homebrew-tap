class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.3/gerry_0.7.3_darwin_arm64.tar.gz"
      sha256 "6ac4fe1172b763d7bf18b58d854eb2e039bf4a54bc75270b1faa461bed27809b"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.3/gerry_0.7.3_darwin_amd64.tar.gz"
      sha256 "95fa4b8daf1568326d156a343be32d87a8c5ec490ec05e2c3147e330f387ac1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.3/gerry_0.7.3_linux_arm64.tar.gz"
      sha256 "19b692cf20e448a7b1f2c3ba0a4ad7b89a1ad463914e71ed3c759de7646cde53"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.3/gerry_0.7.3_linux_amd64.tar.gz"
      sha256 "3d7d304e3d572626561a3990327b138e077210fecabbdf7761217be679e523d0"
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

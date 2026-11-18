class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.0/gerry_0.9.0_darwin_arm64.tar.gz"
      sha256 "227d5cd097d602530b733a2d0794d47d4d481b543b7ebe4363c7e0bb2127548a"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.0/gerry_0.9.0_darwin_amd64.tar.gz"
      sha256 "2271b6ccc73391026d2a15c3cc52282f9abc91e2c928398db15005bd19be60f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.0/gerry_0.9.0_linux_arm64.tar.gz"
      sha256 "548f7a5f143326953618f8f0461cabec6836c15616ac55e0f7459d378454a35d"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.9.0/gerry_0.9.0_linux_amd64.tar.gz"
      sha256 "8680a7c65df171165220c5ea84a954cffc8acf52431ed2fc704a27c574303bd0"
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

class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.2/gerry_0.7.2_darwin_arm64.tar.gz"
      sha256 "329b7078d4c10e357ccc0fa03401337f6700f3f17566b464563138f5b89bbaac"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.2/gerry_0.7.2_darwin_amd64.tar.gz"
      sha256 "9ed6f1b547debd7aed8e6f42998f42ed5e96ee084d13ca36643a3cffbbb96efe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.2/gerry_0.7.2_linux_arm64.tar.gz"
      sha256 "798ecddff14dc8f714795889bd6e9f30da2ad0b5b4038e8c5f2a31a0f9ad0836"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.2/gerry_0.7.2_linux_amd64.tar.gz"
      sha256 "b1dd43084c4543371edd3e29d79c92750bdd837b33a4ac7b56d365d6229a35a8"
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

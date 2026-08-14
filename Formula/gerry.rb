class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.1/gerry_0.6.1_darwin_arm64.tar.gz"
      sha256 "80a5e2dd0f00517f82aab2de5c575ee8b7c4d045a247b96e2fe983e8d66bc5f5"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.1/gerry_0.6.1_darwin_amd64.tar.gz"
      sha256 "11450c3d1abb818e5d18b007d0ee411606d1eb8bef0a4a9a470ed67e1f8af0e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.1/gerry_0.6.1_linux_arm64.tar.gz"
      sha256 "b92ad31badf22f8b09fc56d2aebddfa5c3a1e7b6cfc06283db892ca057876fe9"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.1/gerry_0.6.1_linux_amd64.tar.gz"
      sha256 "a915a928523e17354b98bec2337013e0d9f8468107c04cd99bc3090d7346855a"
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

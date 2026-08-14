class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.2/gerry_0.6.2_darwin_arm64.tar.gz"
      sha256 "05d679d465d2aceb57b9098387706f4a6c35d51333639b3af5d301d4dbe05d18"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.2/gerry_0.6.2_darwin_amd64.tar.gz"
      sha256 "b630a8de2d760edcbb30958d3ed7e508e85a7efd182b2a4d25991d87f11d78d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.2/gerry_0.6.2_linux_arm64.tar.gz"
      sha256 "97ec045dd134225d42a28900b385bdd86e01a530a4d5c46ea52757133c2ded84"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.6.2/gerry_0.6.2_linux_amd64.tar.gz"
      sha256 "6578ee1fb4ec654b6486f1ff4221c6110829c9bb7d3a5bf0e1a9d2dd2b2bc3ab"
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

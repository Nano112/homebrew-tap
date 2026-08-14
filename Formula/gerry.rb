class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.1/gerry_0.7.1_darwin_arm64.tar.gz"
      sha256 "9bf885627fbbf02ab1281c2a4f22fade9b60a94f26ca8df965994f6e283b4b66"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.1/gerry_0.7.1_darwin_amd64.tar.gz"
      sha256 "123ed3c23d354064f7a1e730b8dd856cb28f6eb6cde29fa532cfc9228df9c09a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.1/gerry_0.7.1_linux_arm64.tar.gz"
      sha256 "40bca1ee75769bd170a95ab037d0df2e4d0dcde4045980acb836f874d0420e54"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.7.1/gerry_0.7.1_linux_amd64.tar.gz"
      sha256 "2d6fae6eaf55dda4f091414337f3003d761d97a1ae3bfc57c638a842bc21f959"
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

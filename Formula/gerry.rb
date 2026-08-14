class Gerry < Formula
  desc "Hostname and port control plane — dev to prod, one authority"
  homepage "https://github.com/Nano112/gerrymander"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.8.0/gerry_0.8.0_darwin_arm64.tar.gz"
      sha256 "3af6a0f665e94945ceeb6e78555174778a7ad68e0e6273eeeffde3c25172cf49"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.8.0/gerry_0.8.0_darwin_amd64.tar.gz"
      sha256 "12039e3fccea760a906b722fcf99e15136322e55f2b342842e2894d97e9a3a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.8.0/gerry_0.8.0_linux_arm64.tar.gz"
      sha256 "7c73232f6dccfd10d7a682130f26a0763efec504868b5b01d35e00b9705abeae"
    end
    on_intel do
      url "https://github.com/Nano112/gerrymander/releases/download/v0.8.0/gerry_0.8.0_linux_amd64.tar.gz"
      sha256 "92924a7f98785b9c4b3924908a34458fa01d9ac553d34fe479e6b69b6fd5b42e"
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

class Flea < Formula
  desc "Search, create, and manage Tori.fi listings with coding agents"
  homepage "https://github.com/raine/flea"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/flea/releases/download/v0.1.2/flea-darwin-arm64.tar.gz"
      sha256 "5afea2284ffbe98a834a734960532e122dad12385c47a50a1a1b6fa66772104d"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.2/flea-darwin-amd64.tar.gz"
      sha256 "cf5ba77eedbe78d6d1ee75c139102b55f1e69873799e3af59287326e037b0bcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/flea/releases/download/v0.1.2/flea-linux-arm64.tar.gz"
      sha256 "7e342f56599dad9aa5a06e9a3e1282a6911b00a41c73a097fb492f9bd25a86c9"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.2/flea-linux-amd64.tar.gz"
      sha256 "6a842e3796d3428cc3990193df744039066f21274bd562616ae25a67a1d07140"
    end
  end

  def install
    bin.install "flea"
  end

  test do
    assert_match "Flea manages Tori.fi", shell_output("#{bin}/flea --help")
  end
end

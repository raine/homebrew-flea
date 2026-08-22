class Flea < Formula
  desc "Deterministic CLI for Tori.fi listing workflows"
  homepage "https://github.com/raine/flea"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/flea/releases/download/v0.1.0/flea-darwin-arm64.tar.gz"
      sha256 "606888ab920274492517cef800bbb94fb79ad8a6e5a05174209927c071892d6c"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.0/flea-darwin-amd64.tar.gz"
      sha256 "80cf7bda3087ac02d08258c1267320fc09a505bdb7d7251fc61667e7d2bb874c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/flea/releases/download/v0.1.0/flea-linux-arm64.tar.gz"
      sha256 "aab2678bf2751044a7040cfa82b7fb731bb08d7cb6a110d7b92ccec8932fc1e4"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.0/flea-linux-amd64.tar.gz"
      sha256 "59eeac4868cc366b0b35526639a485018be22970daf2018c4884edf563b07035"
    end
  end

  def install
    bin.install "flea"
  end

  test do
    assert_match "Flea manages Tori.fi", shell_output("#{bin}/flea --help")
  end
end

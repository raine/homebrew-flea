class Flea < Formula
  desc "Search, create, and manage Tori.fi listings with coding agents"
  homepage "https://github.com/raine/flea"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/flea/releases/download/v0.1.1/flea-darwin-arm64.tar.gz"
      sha256 "d3661c1fbd7c8fdd33cea661c0ce2f96227fd3d189051b1a2b2f6575c926e1f1"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.1/flea-darwin-amd64.tar.gz"
      sha256 "cca0fa97b83173e0cd62a295578a1b58c2278ce17deff0f86e735a3595f33f14"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/flea/releases/download/v0.1.1/flea-linux-arm64.tar.gz"
      sha256 "7e245db2f9d711e0370ea105f6787224b930ca59e6ff9d643cffd90a5444b1fc"
    else
      url "https://github.com/raine/flea/releases/download/v0.1.1/flea-linux-amd64.tar.gz"
      sha256 "22c8b71674c92747a0a932f86daa8ef702f5dc9fd48a61d0ae78c3aef03b3aec"
    end
  end

  def install
    bin.install "flea"
  end

  test do
    assert_match "Flea manages Tori.fi", shell_output("#{bin}/flea --help")
  end
end

require "formula"

class Griddb < Formula
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/releases/download/1.0.0/griddb-macos-installer-x64-4.5.0.pkg"
  version "1.0.0"
  # Homebrew requires tests.
  def install
    system "sudo installer -pkg griddb-macos-installer-x64-4.5.0.pkg -target /"
    bin.install "griddb"
  end

  test do
    assert_match "fed version 1.0.0", shell_output("#{bin}/griddb -v", 2)
  end
end

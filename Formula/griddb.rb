require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5049101/tungduong.tar.gz"
  version "1.0.0"
  sha256 "236c275a317947bb4595ac50cfc52d54ebc875ab0e5cc083f0196d921af80108"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"

  def install
    system "cd client/c; ./bootstrap.sh; ./configure --prefix=#{prefix} ; make install"
  end

  test do
    system "#{bin}/griddb", "--sysinfo"
  end

end

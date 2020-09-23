class Griddb < Formula
  desc "Nguyen Tien Tung Duong"
  homepage "https://github.com/tungduong97"
  url "https://github.com/tungduong97/homebrew-tools/files/5261144/nttd.tar.gz"
  version "1.0.0"
  sha256 "4340de315795d3ef57e8423170245e066d1150f75ebffe523ec1533976ad9d2c"
  license "YMH"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"

  def install
    system "cd client/c; ./bootstrap.sh; ./configure --prefix=#{prefix} ; make install"
  end

  test do
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end

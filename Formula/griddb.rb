class Griddb < Formula
  desc "Nguyen Tien Tung Duong"
  homepage "https://github.com/tungduong97"
  url "https://github.com/tungduong97/homebrew-tools/files/5261144/nttd.tar.gz"
  version "1.0.0"
  sha256 "4340de315795d3ef57e8423170245e066d1150f75ebffe523ec1533976ad9d2c"
  license "YMH"
  
  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "cf7e64a4a702db6667582d6a8d83107b67d1457a623fbe04426d9702023612fa" => :catalina
    #sha256 "199d0fa0c97e376933c8cca82e44503b36f610f7edb2170e6a1e7e7491c82017" => :mojave
    #sha256 "c210ec1143b73616108891c3cefaa31754c5bd5fda0222e2e3266035488a1353" => :high_sierra
  end

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"

  def install
    system "Dir client/c"
    system "./bootstrap.sh"
    system "configure --prefix=#{prefix}"
    system "make", " install"
  end

  test do
    assert_equal "#{HOMEBREW_PREFIX}/lib", shell_output("#{bin}/pg_config --libdir").chomp
    # executables being tested: `system "#{bin}/program", "do", "something"`.
  end
end

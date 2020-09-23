class Griddb < Formula
  desc "Nguyen Tien Tung Duong"
  homepage "https://github.com/tungduong97"
  url "https://github.com/tungduong97/homebrew-tools/files/5261144/nttd.tar.gz"
  version "1.0.0"
  sha256 "4340de315795d3ef57e8423170245e066d1150f75ebffe523ec1533976ad9d2c"
  license "YMH"
  
  bottle do
    sha256 "cf7e64a4a702db6667582d6a8d83107b67d1457a623fbe04426d9702023612fa" => :catalina
    sha256 "199d0fa0c97e376933c8cca82e44503b36f610f7edb2170e6a1e7e7491c82017" => :mojave
    sha256 "c210ec1143b73616108891c3cefaa31754c5bd5fda0222e2e3266035488a1353" => :high_sierra
  end

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"
  depends_on "gcc"

  def install
    system "cp client/c/sample/sample1.c #{prefix}"
    system "cd client/c; ./bootstrap.sh;  ./configure --prefix=#{prefix}; make install"
  end

  test do
    system "gcc #{prefix}/sample1.c -lgridstore -o #{prefix}/sample1"
    # Create two dummy files
    #(testpath/"file1").write "foo\nbar\nqux"
    #(testpath/"file2").write "bar\nabc"

    # Ensure `match bar` finds both files
    #assert_match "file1_ 2  bar\n***\nfile2_ 1  bar",
      #shell_output("#{bin}/griddb bar")
      #shell_output("gcc #{prefix}/sample1.c -lgridstore -o #{prefix}/sample1")

    # Ensure `match abc` finds the second file
    #assert_match "file2_ 2  abc", shell_output("#{bin}/griddb abc")

    # Ensure `match idontmatchanything` doesn’t match any of the files
    #assert_not_match(/file[12]/,
    # shell_output("#{bin}/griddb idontmatchanything"))
  end
end

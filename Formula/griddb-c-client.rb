class GriddbCClient < Formula
  desc "Library for GridDB C Client provides a C interface for GridDB"
  homepage "https://github.com/griddb/c_client"
  url "https://github.com/griddb/c_client/archive/v5.0.0.tar.gz"
  sha256 "bf9eaca4df14bd3badc662dc3a6db5cdcae5b35e9e50b48427c9b9dd02bc116e"
  license "Apache-2.0"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  uses_from_macos "llvm"

  def install
    cd "client/c" do
      touch "AUTHORS"
      touch "COPYING"
      touch "ChangeLog"
      touch "INSTALL"
      touch "NEWS"
      touch "README"
      system "glibtoolize", "-c"
      system "aclocal"
      system "autoconf"
      system "automake", "-a", "-c"
      system "./configure", "--prefix=#{prefix}"
      system "make", "install"
    end
  end

  test do
    (testpath/"sample.c").write <<~EOS
      #include "gridstore.h"
      #include <stdio.h>
      int main() {
          GSGridStoreFactory* p = gsGetDefaultFactory();
          if (p != NULL) {
              printf("Get default GSGridStoreFactory instance");
          }
          return 0;
      }
    EOS
    system ENV["CC"], "-I#{include}", "-L#{lib}", "sample.c", "-lgridstore", "-o", "sample"
    assert_equal "Get default GSGridStoreFactory instance", `./sample`
  end
end

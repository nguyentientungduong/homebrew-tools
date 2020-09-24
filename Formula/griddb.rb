class Griddb < Formula
  desc "Nguyen Tien Tung Duong"
  homepage "https://github.com/tungduong97"
  url "https://github.com/tungduong97/homebrew-tools/files/5261144/nttd.tar.gz"
  version "4.5.0"
  sha256 "4340de315795d3ef57e8423170245e066d1150f75ebffe523ec1533976ad9d2c"
  license "YMH"
  
  #bottle do
    #sha256 "cf7e64a4a702db6667582d6a8d83107b67d1457a623fbe04426d9702023612fa" => :catalina
    #sha256 "199d0fa0c97e376933c8cca82e44503b36f610f7edb2170e6a1e7e7491c82017" => :mojave
    #sha256 "c210ec1143b73616108891c3cefaa31754c5bd5fda0222e2e3266035488a1353" => :high_sierra
  #end

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "llvm"
  depends_on "ruby"

  def install
    #system "cp client/c/sample/sample1.c #{prefix}"
    system "cd client/c; ./bootstrap.sh;  ./configure --prefix=#{prefix}; make install"
  end

  test do
    (testpath/"checkfilecompile.rb").write <<~EOS
      if(File.file?('#{lib}/libgridstore.0.dylib')) 
        puts 'file or directory exists'
      else 
        puts 'file or directory not found'
      end
    EOS
    system "ruby", "checkfilecompile.rb"
    assert_equal "file or directory exists\n", `ruby ./checkfilecompile.rb`
    system "echo", "Check system compile successful !"
    
    (testpath/"checkfileheader.rb").write <<~EOS
      if(File.file?('#{include}/gridstore.h')) 
        puts 'file or directory exists'
      else 
        puts 'file or directory not found'
      end
    EOS
    system "ruby", "checkfileheader.rb"
    assert_equal "file or directory exists\n", `ruby ./checkfileheader.rb`
    system "echo", "Check system header successful !"
    
    
    #system "gcc", "#{prefix}/sample1.c", "-lgridstore", "-o", "sample1"
    #assert_equal "Hello, world!\n", `./sample1`
    #system "File.file?('#{lib}/libgridstore.0.dylib')"  
    #system "File.file?('#{include}/gridstore.h')"
  end
end

require "formula"

class Griddb < Formula
  desc "Internet file retriever"
  homepage "https://github.com/tungduong97/homebrew-tools"
  url "https://github.com/tungduong97/homebrew-tools/files/5049101/tungduong.tar.gz"
  sha256 "236c275a317947bb4595ac50cfc52d54ebc875ab0e5cc083f0196d921af80108"
  version "1.0.0"
  
  livecheck do
    url :stable
  end

  bottle do
    sha256 "ef65c759c5097a36323fa9c77756468649e8d1980a3a4e05695c05e39568967c" => :catalina
    sha256 "28f4090610946a4eb207df102d841de23ced0d06ba31cb79e040d883906dcd4f" => :mojave
    sha256 "91dd0caca9bd3f38c439d5a7b6f68440c4274945615fae035ff0a369264b8a2f" => :high_sierra
  end

  head do
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "xz" => :build
    depends_on "gettext"
  end

  depends_on "pkg-config" => :build
  depends_on "libidn2"
  depends_on "openssl@1.1"

  on_linux do
    depends_on "util-linux"
  end

  def install
    system "cd", "client/c"
    system "./bootstrap", "--skip-po" if build.head?
    system "./configure", "--prefix=#{prefix}",
                          "--sysconfdir=#{etc}",
                          "--with-ssl=openssl",
                          "--with-libssl-prefix=#{Formula["openssl@1.1"].opt_prefix}",
                          # Work around a gnulib issue with macOS Catalina
                          "gl_cv_func_ftello_works=yes",
                          "--disable-debug",
                          "--disable-pcre",
                          "--disable-pcre2",
                          "--without-libpsl"
    system "make", "install"
  end

  test do
    system bin/"griddb", "-O", "/dev/null", "https://google.com"
  end
  
end

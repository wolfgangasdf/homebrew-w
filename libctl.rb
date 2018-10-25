class Libctl < Formula
  homepage "https://github.com/stevengj/libctl"
  url "https://github.com/stevengj/libctl/releases/download/v4.1.3/libctl-4.1.3.tar.gz"
  sha256 "6b9fc9dd3ed74f4b3be0910b27ca41b5982474ec3a2c9d7eb0387eb0fa38ff81"

  depends_on "guile"
  depends_on "gcc" if OS.mac? # for gfortran

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "LIBS=-lm"
    system "make", "install"
  end
end

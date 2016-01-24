class Harminv < Formula
  desc "Calculates harmonic inversion, used by Meep and MBP"
  homepage "http://ab-initio.mit.edu/wiki/index.php/Harminv"
  url "http://ab-initio.mit.edu/harminv/harminv-1.4.tar.gz"
  sha256 "538e9b7766abcb0bf9db74cf47de5c4e8dfe8d724b047ea68550a5ee4c43b5de"

  depends_on "cmake" => :build
  depends_on :fortran

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "harminv", "-V"
  end
end

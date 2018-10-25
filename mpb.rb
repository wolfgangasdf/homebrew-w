class Mpb < Formula
  desc "MIT Photonic-Bands for computation of periodic dielectrica"
  homepage "http://ab-initio.mit.edu/wiki/index.php/MIT_Photonic_Bands"
  url "https://github.com/stevengj/mpb/releases/download/v1.6.2/mpb-1.6.2.tar.gz"
  sha256 "aae270f9f51e7ff852fe578b8ef775b22489d4198f6a35ee0a91a60548fd1e3a"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "openblas"
  depends_on "guile"
  depends_on "fftw"
  depends_on "h5utils"
  depends_on "libctl"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "mpb", "--version"
  end
end

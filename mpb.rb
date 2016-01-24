class Mpb < Formula
  desc "MIT Photonic-Bands (MPB): program for computing the band structures (dispersion relations) and electromagnetic modes of periodic dielectric structures"
  homepage "http://ab-initio.mit.edu/wiki/index.php/MIT_Photonic_Bands"
  url "http://ab-initio.mit.edu/mpb/mpb-1.5.tar.gz"
  version "1.5"
  sha256 "3deafe79185eb9eb8a8fe97d9fe51624221f51c1cf4baff4b4a7242c51130bd7"

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
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "mpb"
  end
end

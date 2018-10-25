class Meep < Formula
  desc "Finite-difference time-domain (FDTD) software from MIT"
  homepage "https://github.com/stevengj/meep"
  url "https://github.com/stevengj/meep/releases/download/v1.6.0/meep-1.6.tar.gz"
  sha256 "b6d8f15ba1af458f134d67fee11205bb32172b83074bc7769be9b2c17a3748d9"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "openblas"
  depends_on "guile"
  depends_on "fftw"
  depends_on "h5utils"
  depends_on "libctl"

  conflicts_with "meep-mpi"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "meep", "--version"
  end
end

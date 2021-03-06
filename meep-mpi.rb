class MeepMpi < Formula
  desc "Finite-difference time-domain (FDTD) software from MIT, MPI version"
  homepage "http://ab-initio.mit.edu/wiki/index.php/Meep"
  url "http://ab-initio.mit.edu/meep/meep-1.3.tar.gz"
  sha256 "564c1ff1b413a3487cf81048a45deabfdac4243a1a37ce743f4fcf0c055fd438"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "openblas"
  depends_on "guile"
  depends_on "fftw"
  depends_on "h5utils"
  depends_on "libctl"
  depends_on "mpich"
  
  conflicts_with "meep"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--with-mpi"
    system "make", "install"
  end

  test do
    system "meep-mpi", "--version"
  end
end

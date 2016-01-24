class Meep < Formula
  desc "finite-difference time-domain (FDTD) simulation software package developed at MIT to model electromagnetic systems"
  homepage "http://ab-initio.mit.edu/wiki/index.php/Meep"
  url "http://ab-initio.mit.edu/meep/meep-1.3.tar.gz"
  version "1.3"
  sha256 "564c1ff1b413a3487cf81048a45deabfdac4243a1a37ce743f4fcf0c055fd438"

  depends_on "cmake" => :build
  depends_on "hdf5"
  depends_on "openblas"
  depends_on "guile"
  depends_on "fftw"
  depends_on "h5utils"
  depends_on "libctl"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "meep"
  end
end

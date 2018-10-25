class H5utils < Formula
  desc "Utilities to work with scientific data in HDF5"
  homepage "https://github.com/stevengj/h5utils/"
  url "https://github.com/stevengj/h5utils/releases/download/1.13.1/h5utils-1.13.1.tar.gz"
  sha256 "c5a76f064d6daa3e65583dce2b61202510e67cf6590f076af9a8aa72511d7d65"

  depends_on "libpng"
  depends_on "hdf5"

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-octave"
    system "make", "install"
  end

  test do
    system bin/"h5fromtxt", "-h"
  end
end


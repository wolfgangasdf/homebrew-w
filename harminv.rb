
class Harminv < Formula
  desc "Harminv is used by Meep and MBP. Harminv is a free program (and accompanying library) to solve the problem of harmonic inversion"
  homepage "http://ab-initio.mit.edu/wiki/index.php/Harminv"
  url "http://ab-initio.mit.edu/harminv/harminv-1.4.tar.gz"
  version "1.4"
  sha256 "538e9b7766abcb0bf9db74cf47de5c4e8dfe8d724b047ea68550a5ee4c43b5de"

  depends_on "cmake" => :build
  depends_on :fortran
  
  def install
    ENV.deparallelize # Serialized installs, please
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" 
  end

end

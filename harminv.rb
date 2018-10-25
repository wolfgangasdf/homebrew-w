class Harminv < Formula
  desc "Calculates harmonic inversion, used by Meep and MBP"
  homepage "https://github.com/stevengj/harminv"
  url "https://github.com/stevengj/harminv/releases/download/v1.4.1/harminv-1.4.1.tar.gz"
  sha256 "e1b923c508a565f230aac04e3feea23b888b47d8e19b08816a97ee4444233670"

  depends_on "cmake" => :build
  depends_on "gcc"

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

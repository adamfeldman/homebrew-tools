class ClojureAT1101502 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://download.clojure.org/install/clojure-tools-1.10.1.502.tar.gz"
  sha256 "393285e682c782bde95187846bd7d933dad756edd1234da0bb1c8bd3cad171f9"

  bottle :unneeded

  depends_on :java => "1.8+"
  depends_on "rlwrap"

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -e \"(+ 1 1)\"").strip
    end
  end
end

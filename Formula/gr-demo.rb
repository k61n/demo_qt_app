# frozen_string_literal: true

class GrDemo < Formula
  desc "Demo Qt and Gr project"
  homepage "https://github.com/k61n/demo_qt_app/"
  url "https://github.com/k61n/demo_qt_app.git",
    branch: "main"
  version "0.1"

  depends_on "cmake" => :build
  depends_on "mlz/packages/gr"

  def install
    cores = `sysctl -n hw.ncpu`.strip
    mkdir "build" do
      qt5_root = `#{HOMEBREW_PREFIX}/bin/brew --prefix qt@5`.strip
      gr_root = `#{HOMEBREW_PREFIX}/bin/brew --prefix gr`.strip
      system "CC=/usr/bin/clang CXX=/usr/bin/clang++ " +
             "#{HOMEBREW_PREFIX}/bin/cmake .. -DCMAKE_BUILD_TYPE=Release " +
             "-DGR_ROOT=#{gr_root} " +
             "-DCMAKE_PREFIX_PATH=#{qt5_root} " +
             "-DBUNDLE=OFF"
      system "#{HOMEBREW_PREFIX}/bin/cmake", "--build", ".", "--parallel", cores.to_s
      system "mkdir -p install/bin"
      system "cp gr-demo install/bin"
      prefix.install Dir["install/*"]
    end
  end

  test do
    # Test commands to verify that your software is working
  end
end

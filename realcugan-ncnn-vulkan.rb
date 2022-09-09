# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RealcuganNcnnVulkan < Formula
  desc "real-cugan converter ncnn version, runs fast on intel / amd / nvidia / apple-silicon GPU with vulkan"
  homepage "https://github.com/nihui/realcugan-ncnn-vulkan"
  url "https://github.com/nihui/realcugan-ncnn-vulkan.git"
  version "20220728"
  sha256 ""
  license "MIT license"

  # depends_on "cmake" => :build
  depends_on "vulkan-headers"
  depends_on "vulkan-loader"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "git","submodule","update","--init","--recursive"
    system "mkdir","-p","build"
    system "cd","build"
    system "cmake","../src"
    system "cmake","--build",".","-j","4"
    bin.install buildpath/"build/realcugan-ncnn-vulkan" 
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test realcugan-ncnn-vulkan`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    #system "false"
    system "#{bin}/realcugan-ncnn-vulkan", "--version"
  end
end

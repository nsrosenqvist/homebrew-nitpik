class Nitpik < Formula
  desc "AI-powered code review CLI"
  homepage "https://nitpik.dev"
  license "BUSL-1.1"
  version "2.1.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-apple-darwin.tar.gz"
      sha256 "0a3d9b0670f49ab39d0e9d9a1ee35533fb57c88c2cdb27133d73ce118913e701" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-apple-darwin.tar.gz"
      sha256 "4645a07c117fa257f17e07b2995442c86a0f3f648a4850f0d2fe35f68c0cb8af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ed22e9af74548a12eea29f024fd64e60505052f86b9bfb91b407f93968545d1"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d577799cfc20e946cfb824166273670fa4f7429d2ee04283f82e89462872496c"
    end
  end

  def install
    bin.install "nitpik"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nitpik --version")
  end
end

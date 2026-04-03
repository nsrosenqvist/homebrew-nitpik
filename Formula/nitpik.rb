class Nitpik < Formula
  desc "AI-powered code review CLI"
  homepage "https://nitpik.dev"
  license "BUSL-1.1"
  version "1.3.0" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-apple-darwin.tar.gz"
      sha256 "7ba089aa3d7bccb6736f78d70f1d4f4bdbc85ead42968d7991072373629bc2df" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-apple-darwin.tar.gz"
      sha256 "b0dd0579dee0eff10d6692253eea0c4d5f295c9ad02c64a3609d3bd92615b892"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5568072078a7833980c9f9f36ec70a5bae12af0fe7dba0d4b028bdf4978cc610"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0d2314ab9599354f78780667064680eb7886a1d8e1fea5be21979d498206104"
    end
  end

  def install
    bin.install "nitpik"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nitpik --version")
  end
end

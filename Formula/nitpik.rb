class Nitpik < Formula
  desc "AI-powered code review CLI"
  homepage "https://nitpik.dev"
  license "BUSL-1.1"
  version "1.4.2" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-apple-darwin.tar.gz"
      sha256 "60a163be19f0eaa11edc06a770169b62b0e152c6bd75535dd4a91ae3f60cfb65" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-apple-darwin.tar.gz"
      sha256 "5fdfb07059b49348d26f47dcd79b1010dfcca53180ae37cd1eeb37a8c762ef42"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e67f7a7ee789de80defb9ff87f0da4d5bf4649a838767c993743c60dff429b4"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1222a768c55e4bf06a852c9362a4d0a60007f60c720916d2866e1bb528bb6b0c"
    end
  end

  def install
    bin.install "nitpik"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nitpik --version")
  end
end

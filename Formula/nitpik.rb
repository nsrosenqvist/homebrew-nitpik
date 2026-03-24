class Nitpik < Formula
  desc "AI-powered code review CLI"
  homepage "https://nitpik.dev"
  license "BUSL-1.1"
  version "1.2.2" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-apple-darwin.tar.gz"
      sha256 "8615930e016b0c03af73fe56b4658281dc5092081350ab9870b4af0683924c8a" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-apple-darwin.tar.gz"
      sha256 "1d9fe116dd8c6ecd3291f504b6f1a43604d06b36dfdd005ba0485bfba4a68b57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbfeb8e01cf883933957a2415735b58e7ccdd96b64a3a5f30ea317670efbb168"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4355e19fe6365df02a00e2718b3c00af2f5786a2a4cb21958a2de4e0556010b6"
    end
  end

  def install
    bin.install "nitpik"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nitpik --version")
  end
end

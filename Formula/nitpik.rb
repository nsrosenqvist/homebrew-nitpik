class Nitpik < Formula
  desc "AI-powered code review CLI"
  homepage "https://nitpik.dev"
  license "BUSL-1.1"
  version "2.1.1" # updated automatically by CI

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-apple-darwin.tar.gz"
      sha256 "bb5e8fe20c60489890d3ffaa4c2d82f840ddacd7ec4723a8ef319e35698fa789" # updated automatically by CI
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-apple-darwin.tar.gz"
      sha256 "050d8f00c29b37c6c16c683aa4c7ac8972524133e5aaa4ba91ece51dc8350d49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7c9720f7cb9679dc7662be13a18e0fbd7d97fbd377db869ca1eaaa7dd6de241"
    elsif Hardware::CPU.intel?
      url "https://github.com/nsrosenqvist/nitpik/releases/download/v#{version}/nitpik-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2203c8ae3970d68952b9245e586c8776de114333c78ff8ace2a08d92d171d266"
    end
  end

  def install
    bin.install "nitpik"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nitpik --version")
  end
end

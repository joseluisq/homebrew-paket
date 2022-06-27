# typed: false
# frozen_string_literal: true

class PaketBin < Formula
  version '0.1.1'
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'paket'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '9d37b5aa7b24bef3a44bfae61b999b78f2a1f5ee39f91d8a965fbef8211581b4'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '2fec45be537bf7fbc2416bc7410b244d20db9794a0ec71c4ddacfc6cf61e2786'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 'a47916e93e05c0b8055c4b12ef496cd1cec7334042042995504f6529f5dbe9d7'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12ecbf3b03bc59624942b31c4fb3e2479af2698e0deada2e0e145f664af3996e"

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end
end

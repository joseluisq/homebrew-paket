# typed: false
# frozen_string_literal: true

class PaketBin < Formula
  version '0.1.6'
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'paket'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '58c5e46ab788e3b2c100b545db66b032cea121858aadf21c018ccc389aea9d83'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'b1aa6c2726ae1bb03be1e028fcf398402298dff0cb562893b233539c2672795b'

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
      sha256 '2a971c6ff4ee24835711493ab09a1a3d5bc5852bea6efe018f3c139d597b1e6f'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8e1853694aed29b24bd39cc4fe7ac2ae810d0a5458d96c2b4c24d5b749e7fd8"

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end
end

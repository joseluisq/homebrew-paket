# typed: false
# frozen_string_literal: true

class PaketBin < Formula
  version '0.1.2'
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'paket'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '4d5686827daf747bf0bd5b046554940bd31cee53d188aa1ad28b16ae5621d8fe'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '0e16c5934bc931c02004a267c54755bc136d8ab0fd24f200ca34fb711693eb96'

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
      sha256 '1fc2641afed9ef22d7ed0b5df91075925caaf84a7129081617741a12f917e120'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7181013ccfeef1232f806398123392f3b5d3eb79a23f9ef5cba96d1db6fa2dbf"

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end
end

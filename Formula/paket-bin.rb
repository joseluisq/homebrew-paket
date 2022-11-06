# typed: false
# frozen_string_literal: true

class PaketBin < Formula
  version '0.1.3'
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'paket'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'fef4bc11b1ac11737a124c4f9a358898b93c4b7413d858c23e0e434694d45fa3'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 '7750241370a4e6cb06a2a31a4e15cbf6e45946daf057cf956ebe94d9591d531e'

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
      sha256 '3a7ee63724a6e84ecf2c9acadb24de842722b135fddaa9704ecf8cc987557093'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae6683ab74e5569fc68e609d1a8627b9101f8c248f5f175e2bfe7a424ff6ff7e"

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end
end

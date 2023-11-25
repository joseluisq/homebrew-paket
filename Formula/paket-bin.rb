# typed: false
# frozen_string_literal: true

class PaketBin < Formula
  version '0.1.5'
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']

  conflicts_with 'paket'

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'cbe9d8a2a9593f8987279c42f787fa918b7a9aa18061593ee73df8028ef0d989'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'ca81ffeb9c66987dbe9f1662daded1e02327d9b0a8d083769bfa8cfba0a3e1b3'

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
      sha256 'a65b27b87a15a5e6aa0d5c3c43f0ea2bbf1a089154ae95c1a2a8ad6b58f2dd06'

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/joseluisq/paket/releases/download/v#{version}/paket-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26ec0f519c3a0b30aee6d77ed67c2dd8a45e2961361c4c41f6620c805e7f43f6"

      def install
        bin.install 'paket'
      end

      test do
        system "#{bin}/paket", '-V'
      end
    end
  end
end

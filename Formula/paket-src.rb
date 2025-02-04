# typed: false
# frozen_string_literal: true

class PaketSrc < Formula
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  url 'https://github.com/joseluisq/paket/archive/v0.1.6.tar.gz'
  sha256 '625a390acc2707ae2879cafc0ac3b06c3f864b7282f658b458e44cd3ad2dbcd2'
  license any_of: ['MIT', 'Apache-2.0']
  head 'https://github.com/joseluisq/paket.git', branch: 'master'

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/paket", '-V'
  end
end

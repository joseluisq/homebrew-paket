# typed: false
# frozen_string_literal: true

class Paket < Formula
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  license any_of: ['MIT', 'Apache-2.0']
  url 'https://github.com/joseluisq/paket/archive/v0.1.1.tar.gz'
  sha256 'c33670eb9f39ce23345d8fe780bdd50d7f34f95f0c523f14f98ca8af416e4262'
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

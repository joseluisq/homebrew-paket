# typed: false
# frozen_string_literal: true

class PaketSrc < Formula
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  url 'https://github.com/joseluisq/paket/archive/v0.1.5.tar.gz'
  sha256 '05f45793c480d9c1aa4298dff1cdf991a4a741f1808f2d0cef107d62b5dae53c'
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

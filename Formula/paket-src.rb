# typed: false
# frozen_string_literal: true

class PaketSrc < Formula
  desc 'A simple and fast package manager for the Fish shell written in Rust'
  homepage 'https://github.com/joseluisq/paket/'
  url 'https://github.com/joseluisq/paket/archive/v0.1.2.tar.gz'
  sha256 '9c8e85134cc35597078ff96d983628f1479fe00821db527f5856b899e20c84c9'
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

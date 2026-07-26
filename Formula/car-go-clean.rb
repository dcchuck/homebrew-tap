class CarGoClean < Formula
  desc "Periodically run cargo clean on Rust projects and track reclaimed disk space."
  homepage "https://github.com/dcchuck/car-go-clean"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "59e246ddd0987cf83b4bbb72ece8f2c4afe30d484a4658f1b1cc0257f232a895"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "c543a3e0d3155c7ab3087049f77aff22c22d4d866dd31a8f3d89231b9e937594"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "ae25fad21cdfdc4dc438312518924af82f61271eadf9e9d3f2a12f95870baf41"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "18e06c150f02b8110d4414ead46fbc4d2484fe81b5ac24df6bbdd252042d4497"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static": {},
    "x86_64-apple-darwin": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
  }

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "car-go-clean"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "car-go-clean"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "car-go-clean"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "car-go-clean"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

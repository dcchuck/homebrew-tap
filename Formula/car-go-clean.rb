class CarGoClean < Formula
  desc "Periodically run cargo clean on Rust projects and track reclaimed disk space."
  homepage "https://github.com/dcchuck/car-go-clean"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "84dc2acd3da8e3db7cf7e62d6491ed6013061856941ebcc2d943b0a9d69f015e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "496ca7fbf76523edc30b71cd322d791cb5c35afa5a0f484e4264ed6b10362a2a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "0f2684e041436363128bccc7d5380a0f572bc31beecee1680ce279a2882b09aa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "6d4708606bb6961ff33175936e3a0d0920cc1921066d3647f0f5f6cd22d2b3a5"
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

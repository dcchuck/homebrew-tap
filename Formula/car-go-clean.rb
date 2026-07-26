class CarGoClean < Formula
  desc "Periodically run cargo clean on Rust projects and track reclaimed disk space."
  homepage "https://github.com/dcchuck/car-go-clean"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "69b1f53708094a364b83ffaecbbe603c2df5be79cd575ecae9e05244a31270ca"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "8762debe4e5bf26e3413c763f77f1caa94ef01ac8a7334acdfebbf6e32718ba2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "7d102a33494080264c5d14b9047dd638e008624d8d63aae189ca3525567422b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "6a10673e9a813978b36e2520fb2a29af8b4e5cd73d5086dfada8cfeeca07a796"
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

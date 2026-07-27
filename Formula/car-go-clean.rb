class CarGoClean < Formula
  desc "Periodically run cargo clean on Rust projects and track reclaimed disk space."
  homepage "https://github.com/dcchuck/car-go-clean"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "f223038e193a878ba607240175f1daa285f51f572988274d68a80da9bbe0f5f7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "4f19c5103fe4d66e33a70cfbdb40199bc64c9aeab0a987cba9c56311e1dc0375"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "f5f8fcc52c12aa2a6f56a90124e215f3f8d97577a9be5677c4f8c707f7d49b4b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "97d7ff967ac55b2a23b0b63903abab0dbe5eef6f416e18e1f9bf8a71e43f90cc"
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

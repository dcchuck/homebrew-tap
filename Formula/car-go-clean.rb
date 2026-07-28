class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.3.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "012bfb5b9cb6d979a6e2abb027b0c9941c5354574511ff49f8dfd5ec1134ae59"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.3.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "48c048c243864e54a646b224c43923433dd1cdad14b5e0d8feafde3ec4ba9c58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.3.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "2adbbbe43f0b56bd2591656e36dcfa8c60e4edda80f6cdd0d860648bf2a14f81"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.3.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "6f2a716b2f2c9f7f238d122f087fb2db1d275e02fea960bb44ad494395601565"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

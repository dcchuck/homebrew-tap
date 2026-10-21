class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.3/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "c0b3062968065739684bb07a5c292ac3e048d854f6d48d45c5cc0056a43daf35"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.3/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "47f78c4817cdcf8818d33160d916d440cbfa8f9e2d08c5d03dafa98fe27c3276"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.3/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "e8fdf7fe9da5cf9b2bbef2c399546d7a4396e8c774d1f19c93e3a36f9ad947df"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.3/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "465d741028c8838913cafa20b75774e72d2679ef78cf09dcd69584065e939456"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

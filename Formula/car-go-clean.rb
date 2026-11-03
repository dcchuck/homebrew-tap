class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.5/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "2bc528d8cb34845b3ca95cb2c222bd5f4b49f34ffeb7e2145a1e32d5c34a9d6f"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.5/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "ad4660c353c089885cbb778b8d6ba61701796a7e8fd36906fda008263ea5b341"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.5/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "3c62d5ba5f7af9e2f1d86d49cc4a884ed64cd9c19adaf33625b2c52070bf1d04"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.5/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "87d59c8829321843c2130579f6d3beaa1fabbca2364b774fea72020954b438fb"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "c9d8175907891592a2f3e896b1a86acbd7766a324878482d3a08a3deda6552d3"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "745609ed3097ce6e63ca20f40926497ef30304049c699658ec3ad8fd306d8d44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "3e31dd3949940bb2172564e4e7af742294e662c1d7981d851460a8d2daac58c0"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "388f2179e2b59bdace61864a7bc2770737ae420c35886928a348e0745602b323"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

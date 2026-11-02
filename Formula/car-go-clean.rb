class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.4/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "6aad00bce22682bb02921aab95e79aaa39de972bac676a54d1dcc3e1bb7eb118"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.4/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "ebe8b9633d9b70faaa7aebe35cc83b9f66c9d735c0bb579a62434e72f6b13e07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.4/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "42f12a80f850f70b7fba08fedd066cafe37b743b18a8bb460c1acb89658dfb15"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.4/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "495ac99a248ec00f1693e388f4dc411006875dc76f86ac0b6258109f5a48446b"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

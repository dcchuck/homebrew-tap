class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "73f8197ebb05d70476acbce5da72b9380b251334ab8aec4f430ef249619442f1"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "b7e074b7e2642484bd098bfa35ebfcb617ca3cf01f009b58ea7ca2581d750b5d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "b6c809437f29b890b00aeb8cab3f21467b877752f2a57f11eb58d9326605217d"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.2.0/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "cfc2475f1676c36daf8d0de9df16e211b098309245825189f70a7da55fbe869d"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

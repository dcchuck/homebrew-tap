class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.2/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "d78a22ea2d74c32f7caf2fd66e85a246d9588736d320b38fe1f5e943fab62a3f"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.2/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "9b244375e810cdf054d35dbbfd542aaedbcaff7684635b741f0c4694cb92c41e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.2/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "a1169cb6e921b1e4796d6ac03eb97bf8635ec79694ad9aaac9cd00427cc0362a"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.2/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "e1516e39addef2e1d7ee57417379fb6fb924ddb55ae5374d82e856abfa505c33"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

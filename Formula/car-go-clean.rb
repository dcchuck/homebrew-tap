class CarGoClean < Formula
  desc "Periodically cleans Rust project build artifacts and tracks reclaimed disk space"
  homepage "https://github.com/dcchuck/car-go-clean"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.1/car-go-clean-aarch64-apple-darwin.tar.xz"
      sha256 "52927963c2ef19402aea158b6e848ace1f37ba7b7eb0c465fcec11c10b141485"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.1/car-go-clean-x86_64-apple-darwin.tar.xz"
      sha256 "67c03e33136e7ac178ddb087f64af425ebffe6eb766870c69ed70a540b4170fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.1/car-go-clean-aarch64-unknown-linux-musl.tar.xz"
      sha256 "40f7cd5874a856b9753c0b3b605de8e0e4b59007d2a5f3ba82f2652ed128ebdc"
    end

    on_intel do
      url "https://github.com/dcchuck/car-go-clean/releases/download/v0.4.1/car-go-clean-x86_64-unknown-linux-musl.tar.xz"
      sha256 "1354fd3b5525410361c863fc8f73ee797e958eb676d2d1e8daf44d489066de1b"
    end
  end

  def install
    bin.install "car-go-clean"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/car-go-clean version")
  end
end

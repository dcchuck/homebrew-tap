class Lbranch < Formula
  include Language::Python::Virtualenv

  desc "Git utility that shows recently checked-out branches in chronological order"
  homepage "https://github.com/dcchuck/lbranch"
  url "https://files.pythonhosted.org/packages/0e/82/b731933c4557e7779ac8cf7695f3c6ae5a710a113b42c1baf46c649bf449/lbranch-0.1.4.tar.gz"
  sha256 "14b1617d14768e6f1bc710c20a2b014710b67623b313788ec92d886ff5b44671"
  license "MIT"

  depends_on "python3"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/lbranch", "--version"
  end
end

class Lbranch < Formula
  include Language::Python::Virtualenv

  desc "Git utility that shows recently checked-out branches in chronological order"
  homepage "https://github.com/dcchuck/lbranch"
  url "https://files.pythonhosted.org/packages/6b/1e/10996b4a5cf89cf38fc9a977f5b6c7f76cff5b42ffd9dabea7c51db1f8b2/lbranch-0.1.5.tar.gz"
  sha256 "14422082a9b94d04f05433b1935a2fd16098dd46a3e395ad87d508d9caedd372"
  license "MIT"

  depends_on "python3"

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"lbranch", "--version"
  end
end

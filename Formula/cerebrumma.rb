class Cerebrumma < Formula
  desc "Portable, git-tracked memory and governance for AI agents"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.1/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "28ca9a75a60c51b6ee9de4527870d779c41345fbcbe55611ad530ba7a3dd5844"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.1/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "8c11dae9d03f7a2d1908f6428d9a90900672ea129555906f93bec788d198305b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.1/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "461cb2ed321d1025065d4533a1f60a7d9533fe28d64f673a574845e9b11a54db"
    end
  end

  def install
    bin.install "cerebrum"
  end

  def caveats
    <<~EOS
      Cerebrumma's CLI is installed as `cerebrum`.

      Get started:
        cerebrum init --global
        cerebrum add --global "your coding rules"
        cerebrum map --graph

      To wire the Brain into Claude Code via MCP, run:
        curl -fsSL https://get.cerebrumma.com | sh
      (installs the optional Python MCP server + auto-configures Claude Code)
    EOS
  end

  test do
    assert_match "cerebrum", shell_output("#{bin}/cerebrum --version")
  end
end

class Cerebrumma < Formula
  desc "Portable, git-tracked memory and governance for AI agents"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.2/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "cfeb3dcf6c54b04dcb0ee8640ae94fb503954ada7aa89cd01e4bf2fb89c1901e"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.2/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "7d245025c7a4e5e539f06d5644f041bec5da5b7e50f780076ea6819218814500"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.2/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "170b8b96428d9809cc01c8e03a0f5e00fb6bbdf6114c81c68beaaba6c72a44bf"
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

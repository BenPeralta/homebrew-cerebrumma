class Cerebrumma < Formula
  desc "Portable, git-tracked memory and governance for AI agents"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.3/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "294fccc810a4b370633d8f526b649de89f66aa7f855b85e42a2a74dcfec73819"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.3/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "726c00638c0723a6a18cad483fe7c27ab16ff867d2537f5ceb2b337ed8375724"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.3/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "813b23bd185cc2861192210f6c9ed2707a9be308505e9c6817263e80afdf3fe4"
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

class Cerebrumma < Formula
  desc "Portable, git-tracked AI Brain for developers"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.4/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "4357ba8c9200b252e873bbf63229a105cf74d37fa7751ee1f28e2343195113dc"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.4/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "a7532d0a0d10f1ead504953f96159a8a3de9d0a961fe78bc9966fa2f08a13c13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.4/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "647dfd304a6063c063d746361f9db22ed116f75f3b3d465564e54ab48084cdd2"
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

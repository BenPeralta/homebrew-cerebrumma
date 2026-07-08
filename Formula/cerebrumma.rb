class Cerebrumma < Formula
  desc "Portable, git-tracked AI Brain for developers"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.3/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "909062734c230b663c739b1a97224a349fb7ca90bd11ee82f3f6f70d0305edb5"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.3/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "c8d504b74acaf24750a01e069b4b704b87c36b5d1a16547e8ee2aa37a57eb8ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.1.3/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "520c4bb7810a28c65afec2f1db653cce6e8cf4b2292ada5e73ec90a9fc673783"
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

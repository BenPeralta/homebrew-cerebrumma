class Cerebrumma < Formula
  desc "Portable, git-tracked memory and governance for AI agents"
  homepage "https://www.cerebrumma.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.4/cerebrum-aarch64-apple-darwin.tar.gz"
      sha256 "bbf6ef76c9816fcd3381cd96dcbeeac56e44741858f65264347145647075daad"
    end
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.4/cerebrum-x86_64-apple-darwin.tar.gz"
      sha256 "872d9e6ad7cc64a3a61ebcdfa0cf61c083afec8a82f0a5f42261c3d62912721c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/BenPeralta/cerebrumma/releases/download/v0.2.4/cerebrum-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5455628cf7d558a5470b90bb007e3e49d7c1d12867b2e55b5a468899cc4a591"
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
        curl -fsSL https://get.cerebrumma.com | sh -s -- --mcp-only
      (adds the Python MCP server + Claude Code config; keeps this brew binary)
    EOS
  end

  test do
    assert_match "cerebrum", shell_output("#{bin}/cerebrum --version")
  end
end

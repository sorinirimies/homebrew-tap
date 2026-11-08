# Rendered by scripts/ci/distro.nu and pushed to sorinirimies/homebrew-tap.
class Nuance < Formula
  desc "Themeable, git-aware Nushell prompt with a live-preview theme picker"
  homepage "https://github.com/sorinirimies/nuance"
  license "MIT"

  depends_on "nushell"

  on_macos do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.1/nuance-aarch64-apple-darwin.tar.gz"
      sha256 "835d62acba64acdfcae7a7f40399aedd056eca18a84ec8f68f0757493858b50d"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.1/nuance-x86_64-apple-darwin.tar.gz"
      sha256 "aad01a648339cc021b5f66e2acc84f279ff56b32ec8d12246d4a542cccf8e636"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.1/nuance-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f5c48c3b0b8e1d28b318bd3aaf287090f8530a404972bfedb457559349bd3f1a"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.1/nuance-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0703db2903bd6ddaa0717ee84ea2af1bcd42123c7cb562ef214b56ca6729440f"
    end
  end

  def install
    bin.install "nuance"
    generate_completions_from_executable(bin/"nuance", "completions")
  end

  def caveats
    <<~EOS
      Run any nuance command once (e.g. `nuance theme`) to install the prompt
      into Nushell's autoload directory, then open a new `nu` shell.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nuance --version")
  end
end

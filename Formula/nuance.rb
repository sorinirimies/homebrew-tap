# Rendered by scripts/ci/distro.nu and pushed to sorinirimies/homebrew-tap.
class Nuance < Formula
  desc "Themeable, git-aware Nushell prompt with a live-preview theme picker"
  homepage "https://github.com/sorinirimies/nuance"
  license "MIT"

  depends_on "nushell"

  on_macos do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.2/nuance-aarch64-apple-darwin.tar.gz"
      sha256 "77d088ec212e057cb8358f7c62d0f3ef7d0898a3e42f49f04e61971aa16a69f7"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.2/nuance-x86_64-apple-darwin.tar.gz"
      sha256 "a9223fe530498263aaefda5559f95e121722612768a3b77765e1b800888f5a7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.2/nuance-aarch64-unknown-linux-musl.tar.gz"
      sha256 "391225013b2f94fc565c3beb30169eacb71b33415c25e2b1beded61d4acb8494"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.2/nuance-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a950e8eb4ef992d1e9b5bbae47f9017fc9945691b6d8a2cd7b6b1824bafea730"
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

# Rendered by scripts/ci/distro.nu and pushed to sorinirimies/homebrew-tap.
class Nuance < Formula
  desc "Themeable, git-aware Nushell prompt with a live-preview theme picker"
  homepage "https://github.com/sorinirimies/nuance"
  license "MIT"

  depends_on "nushell"

  on_macos do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.3/nuance-aarch64-apple-darwin.tar.gz"
      sha256 "f619117faebb171b84680dbace70b0a00e85dad1f54631be24eefa38c1eeb901"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.3/nuance-x86_64-apple-darwin.tar.gz"
      sha256 "27d2402c7bab70a7f4fb3092e999e5fc3bf3326e3c1376d98468b216bb4cdccb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.3/nuance-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b32c65140e6077d4628fea4308f90023258471f52d1088e5903571731062669c"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.3/nuance-x86_64-unknown-linux-musl.tar.gz"
      sha256 "512e788e49afb1fa7baa191f971bb6fd212698c437319b35bd92741f2e32136c"
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

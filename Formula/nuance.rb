# Rendered by scripts/ci/distro.nu and pushed to sorinirimies/homebrew-tap.
class Nuance < Formula
  desc "Themeable, git-aware Nushell prompt with a live-preview theme picker"
  homepage "https://github.com/sorinirimies/nuance"
  version "0.11.0"
  license "MIT"

  depends_on "nushell"

  on_macos do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.0/nuance-aarch64-apple-darwin.tar.gz"
      sha256 "f97dde51a35a4e8b811f7f81ef051f61050121b0c12b5257293cbb324db11651"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.0/nuance-x86_64-apple-darwin.tar.gz"
      sha256 "a84929b92b9a96ff7a9ae054ffb5a7b22e2899820ce9c5ac2cb1dcb6677f1435"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.0/nuance-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5eac993915c1640f45a135436621470ceef13f5e44ca03235dacff8deae43f81"
    end
    on_intel do
      url "https://github.com/sorinirimies/nuance/releases/download/v0.11.0/nuance-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8507bd7c34586d696f4582fb105654703d0353a1cafe9b3e89ff2b1963296002"
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

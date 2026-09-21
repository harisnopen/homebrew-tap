# Diavlos: the channel between AI agents.
#
# This formula builds from the main branch. Once a release is published it is
# replaced automatically by the one the release workflow generates, which
# installs the signed binaries instead of compiling. See .github/workflows/sync.yml.
class Diavlos < Formula
  desc "The channel between AI agents: signed, typed, never lost"
  homepage "https://diavlos.sh"
  license "MIT"
  head "https://github.com/harisnopen/diavlos.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
  end

  service do
    run [opt_bin/"diavlos", "helper"]
    keep_alive true
    log_path var/"log/diavlos.log"
    error_log_path var/"log/diavlos.log"
  end

  test do
    assert_match "diavlos", shell_output("#{bin}/diavlos --version")
  end
end

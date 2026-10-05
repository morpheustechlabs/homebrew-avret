#!/usr/bin/env python3
"""
Sync the Homebrew AVRET cask from the public AVRET GitHub repository.

Usage:
    ./scripts/update_cask.py 1.1.6 <sha256>

Example:
    ./scripts/update_cask.py 1.1.6 711660764310b8c3bc530fbe7ac556005ca5d14cd11e48ee56fa58745bbb95fc
"""

from pathlib import Path
import re
import subprocess
import sys

SSH_REMOTE = "git@morpheustechlabs-GitHub:morpheustechlabs/homebrew-avret.git"

def run(cmd, cwd=None):
    print("+", " ".join(str(x) for x in cmd))
    subprocess.run([str(x) for x in cmd], cwd=cwd, check=True)

def main():
    if len(sys.argv) != 3:
        raise SystemExit("Usage: update_cask.py VERSION SHA256")

    version = sys.argv[1].strip()
    sha256 = sys.argv[2].strip().lower()

    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise SystemExit("ERROR: version must look like 1.1.6")

    if not re.fullmatch(r"[0-9a-f]{64}", sha256):
        raise SystemExit("ERROR: invalid SHA-256")

    repo = Path(__file__).resolve().parent.parent
    cask = repo / "Casks" / "avret.rb"

    text = cask.read_text()
    text = re.sub(r'version "[^"]+"', f'version "{version}"', text, count=1)
    text = re.sub(r'sha256 "[0-9a-fA-F]{64}"', f'sha256 "{sha256}"', text, count=1)
    cask.write_text(text)

    if not (repo / ".git").exists():
        run(["git", "init", "-b", "main"], cwd=repo)

    remotes = subprocess.run(
        ["git", "remote"],
        cwd=repo,
        text=True,
        capture_output=True,
        check=True,
    ).stdout.split()

    if "origin" in remotes:
        run(["git", "remote", "set-url", "origin", SSH_REMOTE], cwd=repo)
    else:
        run(["git", "remote", "add", "origin", SSH_REMOTE], cwd=repo)

    if subprocess.run(["brew", "--version"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL).returncode == 0:
        # Style check if Homebrew is installed.
        subprocess.run(["brew", "style", str(cask)], cwd=repo)

    run(["git", "add", "Casks/avret.rb", "README.md", "scripts/update_cask.py"], cwd=repo)

    changed = subprocess.run(["git", "diff", "--cached", "--quiet"], cwd=repo).returncode != 0
    if changed:
        run(["git", "commit", "-m", f"avret {version}"], cwd=repo)

    run(["git", "branch", "-M", "main"], cwd=repo)
    run(["git", "push", "-u", "origin", "main"], cwd=repo)

    print()
    print("Homebrew tap updated.")
    print("Install with:")
    print("  brew install --cask morpheustechlabs/avret/avret")

if __name__ == "__main__":
    main()

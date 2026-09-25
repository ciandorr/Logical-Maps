"""Archive or commit only durable quarantine artifacts, excluding credentials."""
from __future__ import annotations

import argparse
import os
from pathlib import Path
import subprocess
import tarfile


DURABLE = ("quarantine.json", "workspaces", "trawls", "unfinished", "candidates",
           "packets", "reviews", "admissions", "publications", "cloud-runs")


def paths(quarantine):
    return [name for name in DURABLE if (quarantine / name).exists()]


def archive(quarantine, destination):
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tarfile.open(destination, "w:gz") as output:
        for name in paths(quarantine):
            output.add(quarantine / name, arcname=name)


def push(quarantine, branch):
    quarantine = quarantine.resolve()
    def git(*args):
        return subprocess.run(["git", "-C", str(quarantine), *args], check=True,
                              capture_output=True, text=True).stdout.strip()
    git("check-ref-format", "--branch", branch)
    if Path(git("rev-parse", "--show-toplevel")).resolve() != quarantine:
        raise ValueError("destination must be its own quarantine repository")
    git("config", "user.name", "github-actions[bot]")
    git("config", "user.email", "41898282+github-actions[bot]@users.noreply.github.com")
    selected = paths(quarantine)
    git("add", "-A", "--", *selected)
    staged = git("diff", "--cached", "--name-only", "-z").split("\0")
    staged = [name for name in staged if name]
    if any(name.split("/", 1)[0] not in DURABLE for name in staged):
        raise ValueError("index contains files outside the quarantine backup allowlist")
    if not staged:
        print("No new quarantine files to commit.")
        return
    git("commit", "-m", "Save theorem trawl " + os.environ.get("GITHUB_RUN_ID", "cloud"))
    # Never force-push or rewrite concurrent operator edits. The uploaded archive
    # retains the complete saved tree when branch protection or a race blocks this.
    git("push", "origin", f"HEAD:refs/heads/{branch}")
    print("Saved quarantine work pushed to " + branch + ".")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--quarantine", type=Path, required=True)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--archive", type=Path)
    mode.add_argument("--push-branch")
    args = parser.parse_args()
    quarantine = args.quarantine.resolve()
    if not (quarantine / "quarantine.json").is_file():
        parser.error("destination must be an initialized quarantine repository")
    if args.archive:
        archive(quarantine, args.archive.resolve())
        print("Recovery archive prepared from durable quarantine artifacts.")
    else:
        try:
            push(quarantine, args.push_branch)
        except (subprocess.CalledProcessError, ValueError):
            # Avoid echoing authenticated Git configuration or credential errors.
            parser.exit(1, "Quarantine push failed. Recover the uploaded archive; check branch permissions and concurrent commits.\n")


if __name__ == "__main__":
    main()

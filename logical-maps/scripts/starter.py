"""Package only reusable tooling and the explicitly curated starter assets."""
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

import pmap


def build_starter(destination: Path | None = None) -> Path:
    assets = pmap.ROOT / "starter"
    if not assets.is_dir():
        raise SystemExit("Starter assets are missing; use a complete Logical Maps starter download.")
    destination = (destination or pmap.BUILD / "logical-maps-starter.zip").resolve()
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="logical-maps-starter-") as tmp:
        root = Path(tmp) / "logical-maps-starter"
        # An allowlist prevents research topics, source papers, private drafts,
        # credentials, repository metadata, or local build products leaking in.
        shutil.copytree(assets, root, ignore=shutil.ignore_patterns(*pmap.IGNORE))
        shutil.copytree(assets, root / "starter", ignore=shutil.ignore_patterns(*pmap.IGNORE))
        (root / "scripts").mkdir()
        for name in ("pmap.py", "starter.py", "check_falsity.py"):
            shutil.copy2(pmap.ROOT / "scripts" / name, root / "scripts" / name)
        for name in ("schema", "viewer"):
            shutil.copytree(pmap.ROOT / name, root / name, ignore=shutil.ignore_patterns(*pmap.IGNORE))
        shutil.copy2(pmap.ROOT / "requirements.txt", root / "requirements.txt")
        # Ship working previews. The internal build must not recursively package
        # another starter; recipients can regenerate their own starter later.
        subprocess.run([sys.executable, str(root / "scripts" / "pmap.py"),
                        "build", "--no-pdf", "--no-starter"], cwd=root, check=True,
                       stdout=subprocess.PIPE, text=True)
        subprocess.run([sys.executable, str(root / "topics" / "example" / "checks" / "relations.py")],
                       cwd=root, check=True, stdout=subprocess.PIPE, text=True)
        # Replace the public file only after the complete package builds.
        staged = Path(tmp) / destination.name
        pmap.zip_tree(root, root.name, staged)
        shutil.copy2(staged, destination)
    return destination


if __name__ == "__main__":
    print(build_starter())

"""Check public files and nested ZIPs; optionally check every reachable Git revision."""
import argparse
from fnmatch import fnmatch
import io
from pathlib import Path, PurePosixPath
import re
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parents[2]
FORBIDDEN = ('.private', '.git', '.env', '.env.*', '*.bundle', '_pmap_audit_*.lean',
             '(style example) index.html', '*Erroneous*.pdf',
             'DU-RESEARCH-*.md', 'DU-SHIFT-CONTINUITY-*.md')
# Report locations only, never the matched credential value.
CREDENTIAL = re.compile(rb'(?:gh[pousr]_[A-Za-z0-9]{30,}|github_pat_[A-Za-z0-9_]{40,}|'
                        rb'AKIA[A-Z0-9]{16}|-----BEGIN (?:RSA |OPENSSH |EC )?PRIVATE KEY-----|'
                        rb'https://api\.cloudflare\.com/client/v4/pages/webhooks/deploy_hooks/[A-Za-z0-9-]+)')


def forbidden(path):
    return any(fnmatch(part, pattern) for part in PurePosixPath(path).parts for pattern in FORBIDDEN)


def inspect(data, label, failures):
    if data.startswith(b'PK\x03\x04'):
        try:
            with zipfile.ZipFile(io.BytesIO(data)) as archive:
                for entry in archive.infolist():
                    location = label + '!' + entry.filename
                    if forbidden(entry.filename):
                        failures.add(location + ': private file')
                    elif not entry.is_dir():
                        inspect(archive.read(entry), location, failures)
        except (zipfile.BadZipFile, RuntimeError) as error:
            failures.add(label + ': unreadable ZIP (' + type(error).__name__ + ')')
    elif CREDENTIAL.search(data):
        failures.add(label + ': possible credential')


def check_worktree(root, failures):
    # Only this outer root's ignored private workspace is omitted. A private
    # directory accidentally placed inside public source folders is reported.
    def walk(directory):
        for path in sorted(directory.iterdir()):
            rel = path.relative_to(root).as_posix()
            if path.parent == root and path.name in ('.git', '.private'):
                continue
            if path.name in ('.lake', '.venv', '__pycache__', '.DS_Store'):
                continue
            if forbidden(rel):
                failures.add(rel + ': private file')
            elif path.is_symlink():
                failures.add(rel + ': symlink requires review before publishing')
            elif path.is_dir():
                walk(path)
            else:
                inspect(path.read_bytes(), rel, failures)
    walk(root)
    tracked = subprocess.check_output(['git', '-C', str(root), 'ls-files', '-z']).split(b'\0')
    for path in filter(None, tracked):
        name = path.decode()
        if forbidden(name):
            failures.add(name + ': private file remains tracked')


def check_history(root, failures):
    def git(*args):
        return subprocess.check_output(['git', '-C', str(root), *args])
    seen = set()
    # Agent checkpoints and local recovery refs are not publication branches.
    commits = git('rev-list', '--branches', '--tags', '--remotes').decode().splitlines()
    for commit in commits:
        for record in git('ls-tree', '-rz', commit).split(b'\0'):
            if not record:
                continue
            metadata, raw_name = record.split(b'\t', 1)
            mode, kind, oid = metadata.decode().split()
            name = raw_name.decode()
            label = commit[:12] + ':' + name
            if forbidden(name):
                failures.add(label + ': private file in history')
            if kind == 'blob' and oid not in seen:
                seen.add(oid)
                inspect(git('cat-file', 'blob', oid), label, failures)
    return len(commits)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--history', action='store_true')
    parser.add_argument('--repo', type=Path, default=ROOT)
    args = parser.parse_args()
    failures = set()
    check_worktree(args.repo, failures)
    if args.history:
        count = check_history(args.repo, failures)
        print(f'Checked {count} reachable commits.')
    if failures:
        for failure in sorted(failures):
            print('FAIL:', failure)
        raise SystemExit(1)
    print('PASS: public files and nested archives contain no prohibited private paths or recognised credentials.')


if __name__ == '__main__':
    main()

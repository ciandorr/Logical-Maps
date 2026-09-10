"""End-to-end starter check. Use --python for a clean requirements-only venv."""
import argparse
from html.parser import HTMLParser
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
from urllib.parse import unquote, urlsplit
import zipfile

import yaml
import pmap


class Links(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links = []

    def handle_starttag(self, tag, attrs):
        for key, value in attrs:
            if key in ('href', 'src') and value:
                self.links.append(value)


def check_links(root):
    for page in root.rglob('*.html'):
        parser = Links()
        parser.feed(page.read_text())
        for link in parser.links:
            url = urlsplit(link)
            if url.scheme or url.netloc or not url.path:
                continue
            target = page.parent / unquote(url.path)
            assert target.exists(), (page, link)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--python', default=sys.executable)
    args = ap.parse_args()
    python = str(Path(args.python).absolute())
    with tempfile.TemporaryDirectory(prefix='logical-maps-clean-check-') as tmp:
        temp = Path(tmp)
        no_tools = temp / 'no-external-tools'
        no_tools.mkdir()
        env = dict(os.environ, PATH=str(no_tools), PYTHONNOUSERSITE='1')
        env.pop('PYTHONPATH', None)

        def run(*command, cwd=pmap.ROOT, ok=True):
            result = subprocess.run([python, *map(str, command)], cwd=cwd, env=env,
                                    text=True, capture_output=True)
            assert (result.returncode == 0) == ok, (command, result.stdout, result.stderr)
            return result

        archive = temp / 'starter.zip'
        run(pmap.ROOT / 'scripts/pmap.py', 'starter', '--out', archive)
        with zipfile.ZipFile(archive) as z:
            names = z.namelist()
            for name in names:
                assert not any(part in name for part in ['unbounded-utility', 'decision-theory', 'Erroneous', '.private/', '.git/', '.lake/']), name
            for required in ['README.md', 'AGENTS.md', 'CLAUDE.md', 'DATA_FORMAT.md', 'UPDATING.md', 'VERSION', 'LICENSE', 'build/example/index.html', 'build/my-map/index.html']:
                assert 'logical-maps-starter/' + required in names, required
            z.extractall(temp / 'extracted')
        root = temp / 'extracted/logical-maps-starter'
        run('scripts/pmap.py', 'validate', cwd=root)
        run('scripts/pmap.py', 'selftest', cwd=root)
        run('topics/example/checks/relations.py', cwd=root)
        check_links(root / 'build')
        # Rebuild from extracted content, including the generic Contribute link.
        run('scripts/pmap.py', 'build', '--no-pdf', cwd=root)
        check_links(root / 'build')
        for topic in ['my-map', 'example']:
            payload = json.loads((root / 'build' / topic / 'data.json').read_text())
            assert payload['downloads']['starter'] == 'logical-maps-starter.zip'
            assert 'Create your own logical map' in payload['contribute_html']
            assert (root / 'build' / topic / payload['downloads']['starter']).exists()
            # The ordinary Full bundle also works when handed to someone else.
            with zipfile.ZipFile(root / 'build' / topic / f'{topic}-map.zip') as z:
                z.extractall(temp / 'bundles')
            bundle = temp / 'bundles' / f'{topic}-map'
            run('scripts/pmap.py', 'validate', cwd=bundle)
            run('scripts/pmap.py', 'build', '--no-pdf', '--no-starter', cwd=bundle)
            check_links(bundle / 'build')
            assert 'checks/countermodels.py' not in (bundle / 'README.md').read_text()
        # Exercise public scaffolding, including the omitted-status fallback.
        run('scripts/pmap.py', 'new-topic', 'scratch', cwd=root)
        for pid in ['a', 'b']:
            run('scripts/pmap.py', 'new-principle', 'scratch', pid, cwd=root)
        run('scripts/pmap.py', 'new-result', 'scratch', 'a-to-b', cwd=root)
        run('scripts/pmap.py', 'new-model', 'scratch', 'candidate', cwd=root)
        record_paths = [root / 'topics/scratch/results/a-to-b.yaml', root / 'topics/scratch/models/candidate.yaml']
        for file in record_paths:
            record = yaml.safe_load(file.read_text())
            assert record['status'] == 'conjectured'
            assert record['certificate']['lean'] == 'none'
            if file.parent.name == 'results':
                assert record['proof'] == ''
                record.update(premises=['a'], conclusion='b')
            else:
                record.update(satisfies=['a'], violates=['b'])
            record['sources'] = ['Unverified proposal in starter integration check.']
            record['certificate']['produced_by'] = 'Starter integration check'
            del record['status']
            file.write_text(yaml.safe_dump(record, sort_keys=False))
        run('scripts/pmap.py', 'validate', 'scratch', cwd=root)
        run('scripts/pmap.py', 'build', 'scratch', '--no-pdf', '--no-starter', cwd=root)
        payload = json.loads((root / 'build/scratch/data.json').read_text())
        assert all(r['status'] == 'conjectured' for r in payload['results'] + payload['models'])
        # Existing records must never be overwritten by repeated scaffolding.
        before = record_paths[0].read_bytes()
        run('scripts/pmap.py', 'new-result', 'scratch', 'a-to-b', cwd=root, ok=False)
        assert record_paths[0].read_bytes() == before
        check_links(root / 'build/scratch')
        print('PASS: clean ZIP, blank/example previews, requirements-only builds without Pandoc/Lean, nested bundles, download links, and conjectured scaffolding/defaults.')


if __name__ == '__main__':
    main()

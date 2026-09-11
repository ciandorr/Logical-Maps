"""Regression checks for private-file exclusions and stale download cleanup."""
import io
from pathlib import Path
import tempfile
from unittest.mock import patch
import zipfile

import check_public
import pmap


def archive(files):
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, 'w') as z:
        for name, content in files.items():
            z.writestr(name, content)
    return buffer.getvalue()


def main():
    failures = set()
    check_public.inspect(archive({'nested.zip': archive({'.private/draft.md': 'private'})}), 'outer.zip', failures)
    assert failures == {'outer.zip!nested.zip!.private/draft.md: private file'}
    failures.clear()
    check_public.inspect(archive({'notes.md': 'public citation notes'}), 'public.zip', failures)
    assert not failures
    # Assemble a synthetic token to check detection without storing a credential.
    check_public.inspect(b'ghp_' + b'x' * 36, 'credential.txt', failures)
    assert failures == {'credential.txt: possible credential'}
    assert check_public.forbidden('lean/_pmap_audit_temporary.lean')
    assert not check_public.forbidden('lean/VERIFICATION.md')

    with tempfile.TemporaryDirectory() as temp:
        root = Path(temp)
        topics = root / 'topics'
        topic = topics / 'sample'
        for directory in ('sources', 'lean'):
            (topic / directory / '.private').mkdir(parents=True)
            (topic / directory / '.private/draft.md').write_text('private')
        (topic / 'sources/paper.txt').write_text('public paper')
        (topic / 'lean/Proof.lean').write_text('-- public proof')
        (topic / 'lean/_pmap_audit_test.lean').write_text('-- temporary')
        payload = {'topic': {'id': 'sample', 'title': 'Sample'}, 'principles': [], 'results': [], 'models': []}
        with patch.object(pmap, 'TOPICS', topics), patch.object(pmap, 'BUILD', root / 'build'), \
             patch.object(pmap, 'validate_topic', return_value=True), \
             patch.object(pmap, 'load_topic', return_value=payload), \
             patch.object(pmap, 'generate_lean_statements'), \
             patch.object(pmap, 'render_writeups', return_value={}), \
             patch.object(pmap, 'enriched_payload', return_value=payload), \
             patch.object(pmap, 'bundle_topic'):
            pmap.build_topic('sample', pdf=False)
            build = root / 'build/sample'
            assert (build / 'sources/paper.txt').exists()
            assert (build / 'lean/Proof.lean').exists()
            assert not list(build.rglob('.private'))
            assert not list(build.rglob('_pmap_audit*'))
            with zipfile.ZipFile(build / 'source.zip') as z:
                assert not any(check_public.forbidden(name) for name in z.namelist())
            # A removed source and a previously copied private file must both
            # disappear on the next build, including when a source dir is gone.
            (topic / 'sources/paper.txt').unlink()
            (build / 'sources/stale-private.txt').write_text('removed draft')
            (build / 'lean/stale.lean').write_text('-- removed proof')
            pmap.build_topic('sample', pdf=False)
            assert not (build / 'sources/paper.txt').exists()
            assert not (build / 'sources/stale-private.txt').exists()
            assert not (build / 'lean/stale.lean').exists()
    print('PASS: nested ZIP audit, credential detection, private build exclusions, and removed download cleanup.')


if __name__ == '__main__':
    main()

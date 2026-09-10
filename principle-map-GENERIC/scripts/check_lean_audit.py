#!/usr/bin/env python3
"""Exercise the verification gate against real Lean output, including false certificates."""
from pathlib import Path
import subprocess
import tempfile
import pmap

ROOT = pmap.TOPICS / 'unbounded-utility' / 'lean'
CASES = {
    'valid': ('theorem claim : True := True.intro', True),
    'wrong_type': ('theorem claim : False := True.intro', False),
    'sorry': ('theorem claim : False := by sorry', False),
    'custom_axiom': ('axiom invented : False\ntheorem claim : False := invented', False),
    'failed_batch': ('theorem claim : True := True.intro\nexample : False := True.intro', False),
}
for label, (body, expected) in CASES.items():
    with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', dir=ROOT, delete=False) as f:
        f.write(body + '\n#print axioms claim\n')
        path = Path(f.name)
    try:
        result = subprocess.run(['lake', 'env', 'lean', str(path)], cwd=ROOT, capture_output=True, text=True)
    finally:
        path.unlink()
    actual = pmap.lean_probe_verdicts(result.returncode, result.stdout + result.stderr, ['claim'])['claim']
    assert actual == expected, (label, result.stdout, result.stderr)
    print(f'PASS {label}', flush=True)
assert not pmap.lean_probe_verdicts(0, '', ['missing'])['missing']
assert not pmap.lean_probe_verdicts(0, "'claim' depends on axioms: [propext,\n sorryAx]", ['claim'])['claim']
assert pmap.lean_probe_verdicts(0, "'claim' depends on axioms: [propext,\n Classical.choice, Quot.sound]", ['claim'])['claim']
print('PASS missing, multiline, and approved dependency reports')

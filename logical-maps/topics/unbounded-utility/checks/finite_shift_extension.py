"""Exact witness diagnostics for the finite-shift total extension.

The analytic write-up proves the saturation and extension lemmas. These
checks do not implement or certify the maximal ordering.
"""

from fractions import Fraction as F
from pathlib import Path
import sys

from shift_continuity import atom, uniform, mix, shifted, mean, survival
from shift_continuity import survival_difference_pieces as pieces
from shift_continuity import signed_areas as areas


def convolve_finite(law, kernel):
    assert all(weight > 0 for weight, _ in kernel)
    assert sum((weight for weight, _ in kernel), F(0)) == 1
    return [(weight * p, lower + shift, upper + shift)
            for weight, shift in kernel for p, lower, upper in law]


u = uniform(0, 1)
a = mix(F(1, 2), shifted(u, F(1)), atom(0))
b = mix(F(1, 2), u, atom(1))
assert mean(a) == mean(b) == F(3, 4)
assert pieces(a, b) == [(F(0), F(1), F(1, 2), F(-1, 2)),
                       (F(1), F(2), F(-1, 2), F(1))]
assert areas(pieces(a, b)) == (F(1, 4), F(1, 4))

# The shared-coin coupling has simple difference (+1,-1), mean zero.
for value in (F(0), F(1, 7), F(1, 2), F(1)):
    coupled_a, coupled_b = (value + 1, F(0)), (value, F(1))
    assert tuple(x - y for x, y in zip(coupled_a, coupled_b)) == (F(1), F(-1))

kernels = [
    [(F(1), F(0))],
    [(F(1), F(-31, 7))],
    [(F(1, 2), F(0)), (F(1, 2), F(1))],
    [(F(1, 3), F(-2)), (F(2, 3), F(-199, 100))],
    [(F(1, 5), F(-7)), (F(1, 5), F(-7)), (F(3, 5), F(4))],
]
for n in (2, 7, 31):
    kernels.append([(F(1, n), F(j, n)) for j in range(n)])

for kernel in kernels:
    left, right = convolve_finite(a, kernel), convolve_finite(b, kernel)
    assert mean(left) == mean(right)
    positive, negative = areas(pieces(left, right))
    assert positive == negative > 0
    supports = sorted({shift for _, shift in kernel})
    first = supports[0]
    first_weight = sum((weight for weight, shift in kernel if shift == first), F(0))
    delta = min(F(1), supports[1] - first) / 2 if len(supports) > 1 else F(1, 2)
    t1, t2 = first + delta / 3, first + 2 * delta / 3
    d1 = survival(left, t1) - survival(right, t1)
    d2 = survival(left, t2) - survival(right, t2)
    assert (d2 - d1) / (t2 - t1) == first_weight / 2 > 0
    assert d1 == first_weight * (t1 - first - 1) / 2

# Small positive mean margins survive, even though the unshifted pair is
# assigned the opposite strict comparison in the proposed total extension.
for epsilon in (F(1, 101), F(1, 7), F(3, 2)):
    positive, negative = areas(pieces(shifted(b, epsilon), a))
    assert positive - negative == epsilon

# Check the new evidence without changing the original conjecture's status.
root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(root / 'scripts'))
import pmap

data = pmap.load_topic('unbounded-utility')
rules = [r for r in data['results'] if r['status'] == 'proved']
models = [m for m in data['models'] if m['status'] == 'proved']
ids = [p['id'] for p in data['principles']]
question = next(r for r in data['results'] if r['id'] == 'conjectured-dtu-shift-implies-transfer')
witness = next(m for m in models if m['id'] == 'finite-shift-total-extension')
assert question['status'] == 'conjectured' and question['proof'] == ''
assert witness['certificate']['source_id'] == 'misc'
assert witness['certificate']['checked_by'] == []
assert witness['certificate']['lean'] != 'verified'
engine = pmap.Engine(ids, rules, models, data['topic'].get('background', []))
assert not engine.model_conflicts
assert set(question['premises']) <= engine.holds[witness['id']]
assert 'shift-transfer' in engine.fails[witness['id']]
answer = engine.resolve_conjecture(question)
assert answer['status'] == 'refuted' and witness['id'] in answer['models']

# Removing the new witness restores the preceding evidence gap.
without = pmap.Engine(ids, rules, [m for m in models if m['id'] != witness['id']])
assert without.resolve_conjecture(question)['status'] == 'open'
presets = {p['id']: p['principles'] for p in data['topic']['background_presets']}
for preset in ('du', 'dtu'):
    assert pmap.Engine(ids, rules, models, presets[preset]).resolve_conjecture(question)['status'] == 'refuted'
continuous = pmap.Engine(ids, rules, models, [*presets['du'], 'l1-continuity'])
assert continuous.resolve_conjecture(question)['status'] == 'proved'
selected = lambda items: [x for x in items if x['certificate'].get('source_id') != 'misc']
filtered = pmap.Engine(ids, selected(rules), selected(models), presets['du'])
assert filtered.resolve_conjecture(question)['status'] == 'open'
assert pmap.analyse(data)['conjectures'][question['id']]['status'] == 'refuted'

print(f'PASS: exact transfer witness, {len(kernels)} finite kernels, continuity margins,')
print('and background/source-sensitive refutation with conjecture history preserved.')

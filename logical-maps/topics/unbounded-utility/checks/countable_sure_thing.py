"""Exact examples and map integration for the nonatomic-mass countermodel.

The write-up proves countable additivity for arbitrary measures and
partitions. These finite diagnostics do not certify that universal proof.
"""

from fractions import Fraction as F
from pathlib import Path
import sys

from shift_continuity import atom, uniform, mix, mean, shifted


def vector(law):
    # This finite representation consists of atoms and uniform intervals.
    return mean(law), sum((p for p, lo, hi in law if lo < hi), F(0))


def masked_interval(lo, hi):
    return mix(hi - lo, uniform(lo, hi), atom(0))


u = uniform(0, 1)
assert vector(u) == (F(1, 2), F(1))
assert vector(u) > vector(atom(F(1, 2)))
assert vector(atom(1)) > vector(u) > vector(atom(0))
for p in (F(1, 11), F(1, 2), F(10, 11)):
    assert vector(mix(p, atom(1), atom(0))) == (p, F(0))
    assert vector(mix(p, atom(1), atom(0))) != vector(u)

# Dyadic cells depending on U, with the exact residual cell retained.
# On each cell, the masked uniform strictly exceeds the masked conditional
# mean: equal first coordinates and a positive nonatomic mass.
for n in (1, 2, 9, 40):
    cells = [(F(1, 2 ** (j + 1)), F(1, 2 ** j)) for j in range(n)]
    cells.append((F(0), F(1, 2 ** n)))
    vectors = []
    for lo, hi in cells:
        local = vector(masked_interval(lo, hi))
        constant = vector(mix(hi - lo, atom((lo + hi) / 2), atom(0)))
        assert local[0] == constant[0] and local > constant
        vectors.append(local)
    assert tuple(sum((v[i] for v in vectors), F(0)) for i in (0, 1)) == vector(u)

# Affine and transfer witnesses, with every transformed support available.
for p in (F(1, 4), F(1, 2), F(3, 4)):
    for b in (F(-1, 32), F(1, 32)):
        x, y = uniform(F(1, 4), F(1, 2)), atom(F(1, 2))
        left = mix(p, shifted(x, b / p), y)
        right = mix(p, x, shifted(y, b / (1 - p)))
        assert all(0 <= lo <= hi <= 1 for law in (left, right) for _, lo, hi in law)
        assert vector(left) == vector(right)

# Coupled difference (+1/4,-1/4) on two equiprobable branches; neither
# complete law is simple, and the two laws differ but must be indifferent.
simple_diff_y = mix(F(1, 2), uniform(0, F(1, 4)), atom(F(1, 2)))
simple_diff_x = mix(F(1, 2), uniform(F(1, 4), F(1, 2)), atom(F(1, 4)))
assert vector(simple_diff_x) == vector(simple_diff_y) == (F(5, 16), F(1, 2))
assert vector(uniform(0, 1)) > vector(atom(F(1, 2)))  # also after x -> 1-x
for n in (0, 10, 1000):
    epsilon = F(1, n + 3)
    approximation = atom(F(1, 2) + epsilon)
    assert vector(approximation) > vector(u) > vector(atom(F(1, 2)))
    assert mean(approximation) - F(1, 2) == epsilon

# For every copula mixture of U=W and W=1-U, including an intermediate
# nonatomic mass, the same X=U/4, Y=1/8, Z=W/4 defeats cancellation.
x, y = uniform(0, F(1, 4)), atom(F(1, 8))
yz = uniform(F(1, 8), F(3, 8))
assert vector(x) > vector(y)
for weight in (F(0), F(1, 7), F(1, 2), F(1)):
    xz = mix(weight, uniform(0, F(1, 2)), atom(F(1, 4)))
    assert vector(xz) == (F(1, 4), weight)
    assert vector(yz) >= vector(xz)
    assert all(0 <= lo <= hi <= F(1, 2) for law in (xz, yz) for _, lo, hi in law)

# Independent uniforms on [0,1/4] have triangular sum density. Check its
# two affine pieces by exact integration, then compare with the uniform
# law of Y+Z. The write-up supplies the general no-atoms argument.
h = F(1, 4)
mass = 16 * h**2 / 2 + 16 * (F(1, 2) * h - ((2*h)**2 - h**2) / 2)
first_moment = 16 * h**3 / 3 + 16 * (F(1, 4) * ((2*h)**2 - h**2) - ((2*h)**3 - h**3) / 3)
assert mass == 1 and first_moment == F(1, 4)
assert (first_moment, F(1)) == vector(yz)

root = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(root / 'scripts'))
import pmap

data = pmap.load_topic('unbounded-utility')
rules = [r for r in data['results'] if r['status'] == 'proved']
models = [m for m in data['models'] if m['status'] == 'proved']
ids = [p['id'] for p in data['principles']]
witness = next(m for m in models if m['id'] == 'lexicographic-nonatomic-mass')
engine = pmap.Engine(ids, rules, models)
assert not engine.model_conflicts
assert len(witness['satisfies']) == 23 and len(witness['violates']) == 16
assert set(witness['satisfies']).isdisjoint(witness['violates'])
assert set(witness['satisfies']) | set(witness['violates']) == set(ids)
assert engine.holds[witness['id']] == set(witness['satisfies'])
assert engine.fails[witness['id']] == set(witness['violates'])
questions = [r for r in data['results'] if r['id'] in (
    'countable-sure-thing-outcomes-to-gambles',
    'countable-sure-thing-simple-to-full-eu',
)]
presets = {p['id']: p['principles'] for p in data['topic']['background_presets']}
for question in questions:
    assert question['status'] == 'conjectured' and question['proof'] == ''
    assert set(question['premises']) <= engine.holds[witness['id']]
    assert question['conclusion'] in engine.fails[witness['id']]
    answer = engine.resolve_conjecture(question)
    assert answer['status'] == 'refuted' and witness['id'] in answer['models']
    stronger = pmap.Engine(ids, rules, models, ['totality', 'stochastic-equivalence'])
    assert stronger.resolve_conjecture(question)['status'] == 'refuted'
    for preset in ('du', 'dtu'):
        assert pmap.Engine(ids, rules, models, presets[preset]).resolve_conjecture(question)['status'] == 'incompatible'
    without = pmap.Engine(ids, rules, [m for m in models if m['id'] != witness['id']])
    assert without.resolve_conjecture(question)['status'] == 'open'

cancellation = next(r for r in rules if r['id'] == 'conjectured-dtu-cancellation-implies-preservation')
assert cancellation['was_conjectured'] is True and cancellation['proof']
assert engine.resolve_conjecture(cancellation)['status'] == 'proved'
for record in (witness, cancellation):
    assert record['certificate']['source_id'] == 'misc'
    assert record['certificate']['checked_by'] == []
    assert record['certificate']['lean'] != 'verified'

print('PASS: exact nonatomic, transfer, simple-difference, L1 and copula witnesses;')
print('all 39 principles assigned consistently; partition identities, two refutations,')
print('DU/DTU incompatibility, and promoted cancellation theorem with preserved history.')

"""Exact diagnostics for finite-support compensation and continuity records.

Fraction arithmetic derives survival pieces from atom/uniform mixture laws,
then checks the explicit bounded witnesses and finite quantizations. These
diagnostics do not prove the universal cone axioms or continuity theorems;
those proofs are in the handwritten write-ups. The integration checks use
the repository's pmap loader and its usual Python dependencies.
"""

from fractions import Fraction as F
from pathlib import Path
import sys


def atom(value):
    return [(F(1), F(value), F(value))]


def uniform(lower, upper):
    assert lower < upper
    return [(F(1), F(lower), F(upper))]


def mix(weight, left, right):
    return [(weight * p, lower, upper) for p, lower, upper in left] + [
        ((1 - weight) * p, lower, upper) for p, lower, upper in right
    ]


def shifted(law, amount):
    return [(p, lower + amount, upper + amount) for p, lower, upper in law]


def mean(law):
    assert sum((p for p, _, _ in law), F(0)) == 1
    return sum((p * (lower + upper) / 2 for p, lower, upper in law), F(0))


def survival(law, threshold):
    """P(X>threshold), treating degenerate intervals as point masses."""
    result = F(0)
    for p, lower, upper in law:
        if lower == upper:
            result += p * (lower > threshold)
        elif threshold <= lower:
            result += p
        elif threshold < upper:
            result += p * (upper - threshold) / (upper - lower)
    return result


def survival_difference_pieces(left, right):
    """Derive affine pieces on open intervals between component endpoints."""
    points = sorted({endpoint for law in (left, right)
                     for _, lower, upper in law for endpoint in (lower, upper)})
    pieces = []
    for lower, upper in zip(points, points[1:]):
        first, second = (3 * lower + upper) / 4, (lower + 3 * upper) / 4
        d_first = survival(left, first) - survival(right, first)
        d_second = survival(left, second) - survival(right, second)
        slope = (d_second - d_first) / (second - first)
        intercept = d_first - slope * first
        pieces.append((lower, upper, slope, intercept))
    return pieces


def signed_areas(pieces):
    """Integrate positive/negative parts, splitting at interior affine roots."""
    positive, negative = F(0), F(0)
    for lower, upper, slope, intercept in pieces:
        cuts = [lower, upper]
        if slope and lower < -intercept / slope < upper:
            cuts.insert(1, -intercept / slope)
        for a, b in zip(cuts, cuts[1:]):
            integral = slope * (b * b - a * a) / 2 + intercept * (b - a)
            if slope * (a + b) / 2 + intercept >= 0:
                positive += integral
            else:
                negative -= integral
    assert positive >= 0 and negative >= 0
    return positive, negative


def check_continuous_law_witnesses():
    u, half = uniform(0, 1), atom(F(1, 2))
    assert mean(u) == mean(half) == F(1, 2)
    pieces = survival_difference_pieces(u, half)
    assert pieces == [(F(0), F(1, 2), F(-1), F(0)),
                      (F(1, 2), F(1), F(-1), F(1))]
    assert signed_areas(pieces) == (F(1, 8), F(1, 8))
    assert all(slope != 0 for _, _, slope, _ in pieces)

    # Build the transfer pair from the distributions of its mixture branches;
    # the piecewise profiles are derived by survival(), not supplied as input.
    left = mix(F(1, 2), shifted(u, F(1)), atom(0))
    right = mix(F(1, 2), u, atom(1))
    assert mean(left) == mean(right) == F(3, 4)
    transfer = survival_difference_pieces(left, right)
    assert transfer == [(F(0), F(1), F(1, 2), F(-1, 2)),
                        (F(1), F(2), F(-1, 2), F(1))]
    assert signed_areas(transfer) == (F(1, 4), F(1, 4))
    assert all(slope != 0 for _, _, slope, _ in transfer)

    # Actual coupling: each tuple gives probability and the affine functions
    # (a*U+b) used by both gambles on the same coin branch.
    coupling = [(F(1, 2), (F(1), F(1)), (F(1), F(0))),
                (F(1, 2), (F(0), F(0)), (F(0), F(1)))]
    differences = [(p, a[0] - b[0], a[1] - b[1]) for p, a, b in coupling]
    assert differences == [(F(1, 2), F(0), F(1)), (F(1, 2), F(0), F(-1))]
    assert sum((p * constant for p, _, constant in differences), F(0)) == 0
    coupled_left = [(p, a[1], a[0] + a[1]) for p, a, _ in coupling]
    coupled_right = [(p, b[1], b[0] + b[1]) for p, _, b in coupling]
    assert coupled_left == left and coupled_right == right

    # A positive shift changes the signed integral by exactly that amount.
    for epsilon in (F(1, 17), F(1, 4), F(3, 2)):
        plus, minus = signed_areas(survival_difference_pieces(shifted(u, epsilon), half))
        assert plus - minus == mean(shifted(u, epsilon)) - mean(half) == epsilon


def check_finite_quantizations():
    def quantized(value, n, epsilon):
        scaled = n * value
        return F(scaled.numerator // scaled.denominator, n) + epsilon

    for epsilon in (F(1, 101), F(1, 17), F(2, 7), F(1, 2), F(3, 2)):
        target = 1 / (2 * epsilon)
        first_n = max(1, (target.numerator + target.denominator - 1) // target.denominator)
        for n in (first_n, first_n + 1, 2 * first_n + 3):
            levels = [quantized(F(2 * k + 1, 2 * n), n, epsilon) for k in range(n)]
            law = [(F(1, n), value, value) for value in levels]
            assert mean(law) == F(1, 2) - F(1, 2 * n) + epsilon
            assert mean(law) >= F(1, 2)
            # On each quantization bin, Q_n is its shifted left endpoint.
            # The affine gap (U+epsilon)-Q_n runs from zero to 1/n.
            for k, (_, value, _) in enumerate(law):
                assert quantized(F(k, n), n, epsilon) == value
                assert F(k, n) + epsilon - value == 0
                assert F(k + 1, n) + epsilon - value == F(1, n)
            # The exceptional endpoint U=1 still obeys the pointwise bound.
            assert quantized(F(1), n, epsilon) == 1 + epsilon


def check_record_integration():
    repo_root = Path(__file__).resolve().parents[3]
    sys.path.insert(0, str(repo_root / 'scripts'))
    import pmap

    data = pmap.load_topic('unbounded-utility')
    engine = pmap.Engine(
        [p['id'] for p in data['principles']],
        [r for r in data['results'] if r['status'] == 'proved'],
        [m for m in data['models'] if m['status'] == 'proved'],
        data['topic'].get('background', []),
    )
    assert not engine.model_conflicts
    presets = {p['id']: p['principles'] for p in data['topic']['background_presets']}
    du, dtu = presets['du'], presets['dtu']
    assert 'totality' not in du and set(dtu) == set(du) | {'totality'}
    continuous_du = [*du, 'vanishing-shift-continuity']
    assert engine.conflict(continuous_du) is None
    for consequence in ('l1-continuity', 'relative-expectation', 'cdf-area-extension',
                        'shift-transfer', 'shift-invariance'):
        assert engine.entails(continuous_du, consequence)[0], consequence
    assert not engine.entails(continuous_du, 'totality')[0]
    assert 'cdf-area-preorder' in engine.separates(continuous_du, 'totality')[0]
    assert 'l1-continuity' in engine.holds['cdf-area-preorder']

    witnesses, _ = engine.separates([*du, 'shift-invariance'], 'shift-transfer')
    assert 'finite-support-compensated-dominance' in witnesses
    assert not engine.entails([*du, 'shift-invariance'], 'shift-transfer')[0]
    # The seed stays incomplete; its separately proved finite-shift total
    # extension now separates the stronger DTU question as well.
    assert 'shift-transfer' in engine.package([*dtu, 'shift-invariance'])['separated']
    assert 'finite-shift-total-extension' in engine.separates([*dtu, 'shift-invariance'], 'shift-transfer')[0]
    assert 'totality' in engine.fails['finite-support-compensated-dominance']


def main():
    check_continuous_law_witnesses()
    check_finite_quantizations()
    check_record_integration()
    print('PASS: exact uniform/mixture survival areas, simple coupled difference, finite quantization bounds, and DU continuity/model integration.')


if __name__ == '__main__':
    main()

"""Diagnostics for the comonotonic-sum witnesses (Claude, Fable 5.1, 23 September 2026).

Part 1: clipped-expectation models. For a standard Cauchy C = Q_C(U) with
C_+ = max(C, 0) and C_- = min(C, 0), the common summand Z = C_+ and the
neutral variable Y = C_+ + a C_- - v (a, v depending on the clipping window)
give, for every window [-g, F],

    E q(X + Z) - E q(Y + Z) = 2 (m(F) - m(F/2)) + o(1) -> (2 ln 2)/pi,

where m(F) = E[min(C_+, F)], because of the doubling-defect identity
2 E[min(V, F)] - E[min(2V, F)] = 2 * integral_{F/2}^{F} P(V > x) dx.
The script checks the closed forms against numerical integration, the
identity on exact finite laws, the neutral constants, positivity of the gap
for every finite cutoff, and convergence to (2 ln 2)/pi.

Part 2: the block-shear construction in the write-up of
conjectured-total-comonotonic-area-extension: two comonotonic shears of an
explicit both-infinite pair give a survival-difference combination that is
nonpositive everywhere and negative on the lowest block.

These are sanity checks of concrete calculations; the quantified claims are
proved in the write-ups. No ultrafilter is simulated.
"""

from fractions import Fraction as Fr
from math import atan, isclose, log, pi


# ---------------------------------------------------------------- Part 1

def m(F):
    """E[min(C_+, F)] for a standard Cauchy C: closed form, written stably for large F."""
    return log(1 + F * F) / (2 * pi) + F * atan(1 / F) / pi


def clipped_expectation(fun, g, F, n=200000):
    """E[max(-g, min(fun(C), F))] by the substitution C = tan(theta)."""
    from math import tan
    h = pi / n
    total = 0.0
    for i in range(n):
        theta = -pi / 2 + (i + 0.5) * h
        total += max(-g, min(fun(tan(theta)), F))
    return total * h / pi


def survival_integral(F, n=20000):
    """2 * integral_{F/2}^{F} P(C > x) dx by the midpoint rule."""
    h = (F / 2) / n
    return 2 * sum(atan(1 / (F / 2 + (i + 0.5) * h)) / pi * h for i in range(n))


def gap(F):
    """2 (m(F) - m(F/2)): the exact clipped gap E q(C_+) - E q(2C_+ + aC_-) + v."""
    return 2 * (m(F) - m(F / 2))


def check_closed_forms():
    for F in [1.0, 4.0, 16.0, 64.0]:
        numeric = clipped_expectation(lambda x: max(x, 0.0), 10 * F, F)
        assert isclose(numeric, m(F), rel_tol=1e-4), (F, numeric, m(F))
        assert isclose(gap(F), survival_integral(F), rel_tol=1e-6)


def check_windows():
    target = 2 * log(2) / pi
    previous = 0.0
    for k in range(0, 40):
        F = 2.0 ** k
        value = gap(F)
        assert 0 < value <= target + 1e-12
        assert value >= previous - 1e-12
        previous = value
    assert isclose(gap(2.0 ** 40), target, rel_tol=1e-9)
    # Neutral constants v = lim E q(C_+ + a C_-) for the recorded windows.
    for a, F_of, g_of, v in [
        (1, lambda t: t, lambda t: t, 0.0),                      # [-t, t]
        (1, lambda t: 2 * t, lambda t: t, log(2) / pi),          # [-t, 2t]
        (2, lambda t: t * t, lambda t: t, (2 * log(2) - 1) / pi),  # [-t, t^2]
    ]:
        for t in [2.0 ** 20, 2.0 ** 30]:
            F, g = F_of(t), g_of(t)
            neutral = m(F) - a * m(g / a)
            assert isclose(neutral, v, abs_tol=1e-5), (a, t, neutral, v)
            # Same gap for every window: the a- and g-terms cancel exactly.
            EXZ = m(F)
            EYZ_plus_v = 2 * m(F / 2) - a * m(g / a)
            assert isclose(EXZ - EYZ_plus_v + neutral, gap(F), rel_tol=1e-12)
    # Symmetric windows: E c_t(C) = 0 exactly, so the witness is exact for every t.
    for t in [0.5, 1.0, 3.0, 10.0]:
        assert isclose(clipped_expectation(lambda x: x, t, t), 0.0, abs_tol=1e-9)


def check_doubling_identity_finite_law():
    """2E[min(V,F)] - E[min(2V,F)] = 2 * integral_{F/2}^{F} P(V > x) dx, exact rationals."""
    law = [(Fr(0), Fr(1, 4)), (Fr(1), Fr(1, 4)), (Fr(3), Fr(1, 4)), (Fr(7), Fr(1, 4))]

    def survival(x):
        return sum(p for v, p in law if v > x)

    for F in [Fr(1), Fr(2), Fr(5, 2), Fr(4), Fr(9)]:
        left = 2 * sum(p * min(v, F) for v, p in law) - sum(p * min(2 * v, F) for v, p in law)
        cuts = sorted({F / 2, F} | {v for v, _ in law if F / 2 < v < F})
        right = 2 * sum((b - a) * survival((a + b) / 2) for a, b in zip(cuts, cuts[1:]))
        assert left == right, (F, left, right)


# ---------------------------------------------------------------- Part 2

def check_block_shears(K=8):
    c = Fr(1, 3)
    blocks = [("N0", -1, c, 2 / c)]
    for k in range(1, K + 1):
        blocks.append((f"P{k}", +1, c / 2 ** k, Fr(2 ** k) / c))
        blocks.append((f"N{k}", -1, c / 2 ** k, Fr(2 ** k) / c))
    assert sum(height for _, _, height, _ in blocks) == 1 - 2 * c / 2 ** K
    pos, x = {}, Fr(0)
    for j, (name, _, _, width) in enumerate(blocks):
        if j:
            x += 100 * 4 ** j
        pos[name] = x
        x += width

    def profile(shift, weight):
        return [(pos[n] + shift.get(n, Fr(0)), pos[n] + shift.get(n, Fr(0)) + w, weight * s * h)
                for n, s, h, w in blocks]

    sh1, sh2 = {}, {}
    sh1["N0"] = pos["P1"] - pos["N0"]
    sh2["N0"] = sh1["N0"] + 2 / c
    for k in range(1, K + 1):
        sh1[f"P{k}"] = sh2[f"P{k}"] = pos[f"N{k}"] - pos[f"P{k}"]
        if k < K:
            sh1[f"N{k}"] = pos[f"P{k + 1}"] - pos[f"N{k}"]
            sh2[f"N{k}"] = sh1[f"N{k}"] + Fr(2 ** k) / c
        else:
            sh1[f"N{k}"], sh2[f"N{k}"] = sh1[f"P{k}"], sh2[f"P{k}"]
    for sh in (sh1, sh2):
        shifts = [sh[n] for n, _, _, _ in blocks]
        assert all(a <= b for a, b in zip(shifts, shifts[1:])), "shear not monotone"
    segments = profile({}, Fr(1)) + profile(sh1, Fr(1, 2)) + profile(sh2, Fr(1, 2))
    cuts = sorted({a for a, _, _ in segments} | {b for _, b, _ in segments})
    values = {}
    for a, b in zip(cuts, cuts[1:]):
        mid = (a + b) / 2
        values[(a, b)] = sum(v for s, e, v in segments if s <= mid < e)
    interior = [v for (a, b), v in values.items() if b <= pos[f"P{K}"]]
    assert max(interior) == 0
    assert min(interior) == -c
    assert sum(1 for v in interior if v < 0) == 2  # the original N0 and copy 2's N0


def main():
    check_closed_forms()
    check_windows()
    check_doubling_identity_finite_law()
    check_block_shears()
    print("PASS: Cauchy clipped closed forms, doubling-defect identity, window-independent gap "
          "2 ln 2 / pi, neutral constants, exact symmetric cancellation, and block-shear kill")


if __name__ == "__main__":
    main()

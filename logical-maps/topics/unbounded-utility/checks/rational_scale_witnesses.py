"""Witness diagnostics for the rational-scale records (Claude, Fable 5.1, 24 September 2026).

Part 1: cdf-area-unit-threshold. X* = 3 - U^{-1/2} has mean 1 and a quantile that is
unbounded below, so X* is above 0 by the unit threshold while X*/2 has mean 1/2 and no
step floor. The half-mixture of X* with sure 0 has mean 1/2 and Q_M(u) = Q_{X*}(2u)
below level 1/18. For U against 1/2 the lower step sums of u - 1/2 + eps on n equal
intervals are eps - 1/(2n), so U + eps is above 1/2 for every eps > 0 while every step
floor of u - 1/2 itself has negative integral.

Part 2: lexicographic-hamel-tie-break. The named widths h1 = u - 1/2 and h2 = Q_M for M
the half-mixture of the uniform on [-1/2, 1/2] with sure 0 have integral 0, and h2 is
piecewise linear with slopes (2, 0, 2), so no nontrivial rational combination of h1,
sqrt(2) h1 and h2 is a step function.

These are sanity checks of explicit calculations; the universal claims (transitivity, the
cone completion, the Hamel extension) are proved in the write-ups.
"""

from fractions import Fraction as F
from math import isclose, sqrt


# ---------------------------------------------------------------- Part 1


def q_star(u):
    """Quantile of X* = 3 - U^{-1/2}."""
    return 3 - u ** -0.5


def cdf_star(t):
    """P(X* <= t) = P(U <= (3 - t)^-2) for t < 2."""
    assert t < 2
    return (3 - t) ** -2


def mean_star():
    """E[X*] by the substitution u = v^2: integral of (6v - 2) dv over [0, 1]."""
    return F(6, 2) - 2


def lower_step_integral(eps, n):
    """Integral of the lower step function of u - 1/2 + eps on n equal intervals."""
    return sum(F(k, n) - F(1, 2) + eps for k in range(n)) / n


def part1():
    assert mean_star() == 1
    assert isclose(sum(q_star((k + 0.5) / 10**6) for k in range(10**6)) / 10**6, 1.0, abs_tol=2e-3)
    assert q_star(1e-12) < -1e5, "quantile of X* is unbounded below"
    assert mean_star() / 2 == F(1, 2)
    # half-mixture with sure 0
    assert isclose(cdf_star(0.0), 1 / 9)
    for u in (0.001, 0.01, 0.05):
        assert u < 1 / 18
        # F_M(t) = F_{X*}(t) / 2 for t < 0, so Q_M(u) = Q_{X*}(2u)
        t = q_star(2 * u)
        assert t < 0 and isclose(cdf_star(t) / 2, u)
    assert q_star(2 * 1e-12) < -1e5, "quantile of the mixture is unbounded below"
    # U against 1/2
    for eps in (F(1, 10), F(1, 100), F(1, 1000)):
        n = int(1 / (2 * eps))
        assert lower_step_integral(eps, n) == eps - F(1, 2 * n) >= 0
    for n in (1, 2, 10, 1000):
        assert lower_step_integral(F(0), n) == -F(1, 2 * n) < 0
    print("part 1: unit-threshold witnesses verified")


# ---------------------------------------------------------------- Part 2


def integral_linear(pieces):
    """Exact integral of a piecewise-linear function given as (a, b, slope, intercept)."""
    return sum(slope * (b * b - a * a) / 2 + intercept * (b - a) for a, b, slope, intercept in pieces)


H1 = [(F(0), F(1), F(1), -F(1, 2))]
H2 = [(F(0), F(1, 4), F(2), -F(1, 2)), (F(1, 4), F(3, 4), F(0), F(0)), (F(3, 4), F(1), F(2), -F(3, 2))]


def part2():
    assert integral_linear(H1) == 0
    assert integral_linear(H2) == 0
    # continuity of h2 at the breakpoints and its quantile pieces
    assert F(2) * F(1, 4) - F(1, 2) == 0 and F(2) * F(3, 4) - F(3, 2) == 0
    slopes_h2 = [p[2] for p in H2]
    assert slopes_h2 == [2, 0, 2]
    # A combination q1 h1 + q2 sqrt2 h1 + q3 h2 that is a step function has zero slope
    # on every piece: on (1/4, 3/4) that is q1 + sqrt2 q2 = 0, forcing q1 = q2 = 0 over
    # the rationals; then 2 q3 = 0 on (0, 1/4).
    for q1, q2 in ((1, 0), (0, 1), (3, -2), (7, 5)):
        assert not isclose(q1 + sqrt(2) * q2, 0.0, abs_tol=1e-12)
    print("part 2: Hamel tie-break widths verified")


if __name__ == "__main__":
    part1()
    part2()

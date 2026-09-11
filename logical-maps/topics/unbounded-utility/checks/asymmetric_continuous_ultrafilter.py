"""Sanity checks for the asymmetric continuous-ultrafilter model.

Exact finite-law calculations and Cauchy closed forms supplement the analytic
proof. They do not decide arbitrary ultrafilter comparisons.
"""

from fractions import Fraction as F
from math import atan, isclose, log, pi


def clip(x, t):
    return max(-t, min(x, 2 * t))


def clipped_value(law, t):
    return sum((p * clip(x, t) for x, p in law), F(0))


def survival(law, threshold):
    return sum((p for x, p in law if x > threshold), F(0))


def tail_difference_integral(left, right, t):
    cuts = sorted({-t, 2 * t} | {
        x for x, _ in left + right if -t < x < 2 * t
    })
    return sum((
        (b - a) * (survival(left, (a + b) / 2)
                   - survival(right, (a + b) / 2))
        for a, b in zip(cuts, cuts[1:])
    ), F(0))


def cauchy_clipped_value(t, sigma=1.0):
    return (sigma / (2 * pi)
            * log((sigma * sigma + 4 * t * t)
                  / (sigma * sigma + t * t))
            + 2 * t / pi * atan(sigma / (2 * t))
            - t / pi * atan(sigma / t))


def main():
    cutoffs = [F(1, 5), F(1), F(3, 2), F(7), F(64), F(10000)]
    xs = [F(-100), F(-3), F(-1, 3), F(0), F(2, 5), F(4), F(100)]
    for t in cutoffs:
        for x in xs:
            for y in xs:
                assert abs(clip(x, t) - clip(y, t)) <= abs(x - y)

        # Each full pair in the infinite alternating distribution cancels.
        # The write-up explains why bounded clipping licenses the pairing.
        for m in range(30):
            a = F(2 * 4**m)
            r = F(1, 2 ** (2 * m + 2))
            assert 2 * r * clip(-a, t) + r * clip(2 * a, t) == 0

    x_law = [(F(-7), F(1, 3)), (F(2), F(1, 6)), (F(9), F(1, 2))]
    y_law = [(F(-2), F(1, 4)), (F(1), F(3, 4))]
    z_law = [(F(-12), F(2, 5)), (F(5), F(3, 5))]
    for t in cutoffs:
        difference = clipped_value(x_law, t) - clipped_value(y_law, t)
        assert difference == tail_difference_integral(x_law, y_law, t)
        for weight in [F(1, 4), F(1, 2), F(3, 4)]:
            left = ([(x, weight * p) for x, p in x_law]
                    + [(x, (1 - weight) * p) for x, p in z_law])
            right = ([(x, weight * p) for x, p in y_law]
                     + [(x, (1 - weight) * p) for x, p in z_law])
            assert clipped_value(left, t) - clipped_value(right, t) == weight * difference

    k = log(2) / pi
    for sigma in [0.25, 1.0, 2.0, 7.0]:
        errors = [abs(cauchy_clipped_value(t * sigma, sigma) - sigma * k)
                  for t in [4, 16, 64, 256, 1024, 8192]]
        assert all(a > b for a, b in zip(errors, errors[1:]))
        assert errors[-1] < 1e-8 * sigma
        assert cauchy_clipped_value(8192 * sigma, sigma) > 0

    # Cauchy and the randomized mixture of -2*Cauchy with zero have the same
    # limiting value k. This is a limit test, not exact finite-t equality.
    t = 8192.0
    fixed_point_gap = cauchy_clipped_value(t) - 0.5 * cauchy_clipped_value(t, 2.0)
    assert abs(fixed_point_gap) < 1e-8
    assert isclose(cauchy_clipped_value(t), k, abs_tol=1e-8)
    assert k > 0.2

    print('PASS: asymmetric clipping, exact paired atoms, tail and mixture identities, '
          'Lipschitz bounds, and Cauchy symmetry/fixed-point witness calculations.')


if __name__ == '__main__':
    main()

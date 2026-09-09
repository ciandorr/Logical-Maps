"""Diagnostics for the geometric continuous-ultrafilter model; no ultrafilter simulation."""
from fractions import Fraction as F
from random import Random


def clip(x, t):
    return max(-t, min(x, t))


def finite_expectation(t, scale, count):
    return sum(F(1, 2**j) * clip(scale * (-2)**j, t)
               for j in range(1, count + 1))


def closed_expectation(t):
    k = 0
    while 2 ** (k + 1) <= t:
        k += 1
    return F(-1 if k % 2 else 0) + F((-1) ** (k + 1), 3 * 2**k) * t


def main():
    # The remaining probability is 2^-count, so a bounded clip leaves at most this error.
    for k in range(1, 13):
        for ratio in [F(1), F(5, 4), F(3, 2), F(7, 4), F(2)]:
            t = 2**k * ratio
            count = k + 25
            assert abs(closed_expectation(t) - finite_expectation(t, 1, count)) <= t / 2**count
    for n in range(1, 9):
        t = F(4**n)
        assert closed_expectation(t) == F(-1, 3)
        assert 2 * closed_expectation(t / 2) == F(-4, 3)
        assert closed_expectation(t) > F(-1, 2)
        assert 2 * closed_expectation(t / 2) < -1
        assert F(1, 2) * (-2 * F(-1, 2)) + F(1, 2) * (-2) == F(-1, 2)
    rng = Random(9092026)
    for _ in range(200):
        xs = [rng.randint(-1000, 1000) for _ in range(8)]
        ys = [rng.randint(-1000, 1000) for _ in range(8)]
        t = rng.randint(1, 500)
        assert abs(sum(clip(x, t) - clip(y, t) for x, y in zip(xs, ys))) <= sum(
            abs(x - y) for x, y in zip(xs, ys))
    print('PASS: exact geometric-tail bounds, scaling reversal, fixed-point constant, and clipping Lipschitz diagnostics')


if __name__ == '__main__':
    main()

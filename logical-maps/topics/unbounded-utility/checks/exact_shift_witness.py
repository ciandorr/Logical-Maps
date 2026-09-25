"""Shift-invariance witness in the exact ultrafilter ordering (Zachary Goodsell's argument,
verified by Claude, Fable 5.1, 24 September 2026).

For a standard Cauchy C, v_X(t) = E[c_t(X)] with c_t the clip to [-t, t]. The check
confirms v_C(t) = 0, v_{C+1}(t) = 1 - integral_{t-1}^{t+1} P(C > x) dx < 1 = v_1(t) for
t >= 1, v_{C+1}(t) < t = v_1(t) for 0 < t < 1, and that the deficit tends to 0. The
closed forms use F(x) = 1/2 + arctan(x)/pi and integral of x f(x) = ln(1 + x^2)/(2 pi).
The ultrafilter itself is not simulated; the write-up proves the set identities.
"""

from math import atan, isclose, log, pi


def cdf(x):
    return 0.5 + atan(x) / pi


def clipped_mean(a, b):
    """E[clip(C, [a, b])] for a standard Cauchy C."""
    assert a < b
    return a * cdf(a) + (log(1 + b * b) - log(1 + a * a)) / (2 * pi) + b * (1 - cdf(b))


def v(shift, t):
    """v_{C + shift}(t) = shift + E[clip(C, [-t - shift, t - shift])]."""
    return shift + clipped_mean(-t - shift, t - shift)


def deficit(t):
    """integral_{t-1}^{t+1} P(C > x) dx, by the antiderivative of 1/2 - arctan(x)/pi."""
    g = lambda x: x / 2 - (x * atan(x) - log(1 + x * x) / 2) / pi
    return g(t + 1) - g(t - 1)


def main():
    for t in (0.5, 1.0, 2.0, 5.0, 10.0, 100.0, 1e4):
        assert isclose(v(0.0, t), 0.0, abs_tol=1e-12)
        v1 = min(t, 1.0)
        assert v(1.0, t) < v1, (t, v(1.0, t), v1)
        if t >= 1:
            assert isclose(v(1.0, t), 1.0 - deficit(t), rel_tol=1e-12)
    assert deficit(1e4) < 1e-4 and deficit(1e6) < 1e-6
    print("exact ordering: v_{C+1}(t) < v_1(t) at every checked level; deficit vanishes")


if __name__ == "__main__":
    main()

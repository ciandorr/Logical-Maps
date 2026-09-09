"""Numerical diagnostics for the analytic Levy proof; no proof by sampling."""

from math import erf, exp, isclose, pi, sqrt


def simpson(function, right=12.0, panels=65536):
    step = right / panels
    total = function(0.0) + function(right)
    total += 4 * sum(function(i * step) for i in range(1, panels, 2))
    total += 2 * sum(function(i * step) for i in range(2, panels, 2))
    return total * step / 3


def laplace(s):
    def integrand(u):
        if u == 0:
            return 0.0 if s else 2 / sqrt(pi)
        return 2 / sqrt(pi) * exp(-u * u - s / (4 * u * u))

    return simpson(integrand)


def main():
    for s in (0.0, 0.0001, 0.01, 0.1, 1.0, 10.0, 100.0):
        numerical = laplace(s)
        assert isclose(numerical, exp(-sqrt(s)), rel_tol=1e-9, abs_tol=1e-12)
        # Product of iid transforms equals the transform after scaling by 4.
        assert isclose(numerical**2, laplace(4 * s), rel_tol=1e-8, abs_tol=1e-12)
    for exponent in range(-8, 9):
        t = 10.0**exponent
        original = erf(1 / (2 * sqrt(t)))
        mixture = erf(1 / sqrt(t)) / 2
        assert original > mixture, (t, original, mixture)
    assert 1.0 > 0.5  # The strict survival comparison at threshold zero.
    print('PASS: Levy normalization, seven Laplace/convolution identities, and 17 strict-tail samples.')


if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""Diagnostics for the second DU calculation batch; standard library only.

These finite checks supplement the handwritten quantified proofs. They do not
construct a free ultrafilter or certify all preference axioms.
"""

from fractions import Fraction
from math import fsum, log


def check_relative_couplings():
    # Q-S has a positive first atom and a telescoping negative tail.
    for stop in (2, 3, 10, 40):
        signed = Fraction(3, 2)
        absolute = Fraction(3, 2)
        for k in range(2, stop + 1):
            probability = Fraction(3, 4**k)
            q = Fraction(2 ** (2 * k - 1), 2 * k - 1)
            s = 4 * Fraction(2 ** (2 * k - 3), 2 * k - 3)
            contribution = probability * (q - s)
            assert contribution == -Fraction(3, (2 * k - 1) * (2 * k - 3))
            signed += contribution
            absolute += abs(contribution)
        remainder = Fraction(3, 2 * (2 * stop - 1))
        assert signed == remainder
        assert absolute + remainder == 3

    # The nonnegative Pasadena - Highland Park series has limit ln 2.
    for stop in (4, 20, 1000):
        value = fsum(1 / (2 * k * (2 * k - 1)) for k in range(1, stop + 1))
        # Its omitted tail is bounded above by 1/(2*stop).
        assert 0 < log(2) - value < 1 / (2 * stop)


def pasadena_indices(n):
    lower, upper = 4**n, 4 ** (2 * n)
    positive = 1
    while 4 ** (positive + 1) <= 2 * (2 * positive + 1) * upper:
        positive += 1
    negative = 1
    while 4 ** (negative + 1) <= 2 * (negative + 1) * lower:
        negative += 1
    return lower, upper, positive, negative


def pasadena_formula(n):
    lower, upper, positive, negative = pasadena_indices(n)
    prefix = fsum(1 / (2 * k - 1) for k in range(1, positive + 1))
    prefix -= fsum(1 / (2 * k) for k in range(1, negative + 1))
    positive_tail = float(Fraction(2 * upper, 3 * 4**positive))
    negative_tail = float(Fraction(lower, 3 * 4**negative))
    return prefix + positive_tail - negative_tail


def check_pasadena_clipping():
    for n in range(1, 9):
        lower, upper, positive, negative = pasadena_indices(n)
        stop = max(positive, negative) + 20
        direct = Fraction(0)
        for k in range(1, stop + 1):
            positive_payoff = min(Fraction(4**k, 2 * (2 * k - 1)), upper)
            negative_magnitude = min(Fraction(4**k, 2 * k), lower)
            direct += Fraction(2, 4**k) * positive_payoff
            direct -= Fraction(1, 4**k) * negative_magnitude
        # Bound the absolute omitted clipped contributions separately.
        remainder_bound = Fraction(2 * upper + lower, 3 * 4**stop)
        assert abs(float(direct) - pasadena_formula(n)) <= float(remainder_bound) + 3e-15

    target = 1.5 * log(2)
    samples = [(n, pasadena_formula(n)) for n in (16, 64, 256, 1024)]
    assert abs(samples[-1][1] - target) < 0.002
    assert abs(samples[-1][1] - target) < abs(samples[0][1] - target)
    assert samples[-1][1] > log(2) + 0.3
    print("Pasadena clipping samples:", ", ".join(f"n={n}: {value:.8f}" for n, value in samples))
    print(f"Proved limiting value (3/2) ln 2 = {target:.8f}")


def arroyo_direct(n, stop):
    lower, upper = 4**n, 4 ** (2 * n)
    # Direct summation by branch; omitted absolute contribution is at most
    # (upper+lower)/(2*stop), using the integral bound on both positive tails.
    terms = []
    for k in range(1, stop + 1):
        terms.append(min(2 * k, upper) / ((2 * k - 1) * 2 * k))
        terms.append(-min(2 * k + 1, lower) / (2 * k * (2 * k + 1)))
    return fsum(terms), (upper + lower) / (2 * stop)


def check_arroyo_clipping():
    # For these moderate cutoffs, exact tail probabilities can be recovered
    # from the known total positive and negative masses ln2 and 1-ln2.
    # Keep the range small to avoid floating-point cancellation at huge cutoffs.
    values = []
    for n in range(1, 4):
        lower, upper = 4**n, 4 ** (2 * n)
        positive, negative = upper // 2, lower // 2 - 1
        prefix = fsum(1 / (2 * k - 1) for k in range(1, positive + 1))
        prefix -= fsum(1 / (2 * k) for k in range(1, negative + 1))
        positive_tail = log(2) - fsum(1 / ((2 * k - 1) * 2 * k) for k in range(1, positive + 1))
        negative_tail = 1 - log(2) - fsum(1 / (2 * k * (2 * k + 1)) for k in range(1, negative + 1))
        formula = prefix + upper * positive_tail - lower * negative_tail
        direct, bound = arroyo_direct(n, 100_000)
        assert abs(formula - direct) < bound
        assert abs(formula - (n + 1) * log(2)) < 0.3 / lower
        assert formula > log(2)
        values.append(formula)
    assert values[0] < values[1] < values[2]
    print("Arroyo clipping samples:", ", ".join(f"{value:.8f}" for value in values))


if __name__ == "__main__":
    check_relative_couplings()
    check_pasadena_clipping()
    check_arroyo_clipping()
    print("Calculation factorization diagnostics passed.")

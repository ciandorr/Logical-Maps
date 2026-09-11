"""Exact arithmetic sanity checks of the extracted infinite-gamble witnesses.

The closed forms are justified in the model write-ups. Finite checks do not
establish the universal or ultrafilter claims.
"""
from fractions import Fraction as F


def clipped_alternating_at_power(k):
    # Sum through k exactly and add the infinite geometric signed tail.
    initial = sum(F((-1) ** n) for n in range(1, k + 1))
    tail = F((-1) ** (k + 1), 3)
    return initial + tail


def main():
    for k in range(1, 41):
        a = clipped_alternating_at_power(k)
        assert a == (F(-2, 3) if k % 2 else F(-1, 3))
        assert (a > F(-1, 2)) == (k % 2 == 0)

        # N=n with probability 2^-n: include the exact infinite tail.
        clipped_n = sum(F(n, 2**n) for n in range(1, k + 1)) + F(k, 2**k)
        deficit = F(1, 2 ** (k - 1))
        assert clipped_n == 2 - deficit
        assert clipped_n < 2
        assert clipped_n + deficit == 2  # L1 witness N_k has mean 2.

        # S=2^n with probability 2^-n, clipped at 2^k.
        clipped_s = sum(F(2**n, 2**n) for n in range(1, k + 1)) + F(2**k, 2**k)
        assert clipped_s == k + 1

        # Countable Sure-Thing witness, conditional on the second-toss value.
        first_toss_mean = F(2 + 2 ** (k + 1), 2)
        assert first_toss_mean - 2**k == 1

    # The alternating fixed-point comparison has candidate value -1/2.
    candidate = F(-1, 2)
    assert F(1, 2) * (-2) + F(1, 2) * (-2 * candidate) == candidate
    print('PASS: exact clipping, incomparability, EU/L1, St Petersburg, and fixed-point witness checks.')


if __name__ == '__main__':
    main()

"""Exact finite diagnostics for the folded-tail cone model; no Zorn simulation."""
from fractions import Fraction as F


def lex_positive(pair):
    a, b = pair
    return a > 0 or (a == 0 and b > 0)


def alternating_tail(k):
    return F((-1) ** (k + 1), 3 * 2**k)


def main():
    # Compare the closed geometric tail with a finite sum and its exact residual bound.
    for k in range(1, 30):
        end = k + 45
        partial = sum((F((-1) ** j, 2**j) for j in range(k + 1, end + 1)), F(0))
        assert abs(alternating_tail(k) - partial) <= F(1, 2**end)
        # Each dyadic interval contributes signed area +1/3 or -1/3.
        area = 2**k * alternating_tail(k)
        assert area == F((-1) ** (k + 1), 3)
    for count in range(1, 20):
        areas = [2**k * alternating_tail(k) for k in range(1, 2 * count + 1)]
        assert sum((max(a, 0) for a in areas), F(0)) == F(count, 3)
        assert sum((max(-a, 0) for a in areas), F(0)) == F(count, 3)

    # In the chosen plane A=(-1/2,1); q=(-1/2,0); the second coordinate is infinitesimal.
    q, a_value = (F(-1, 2), F(0)), (F(-1, 2), F(1))
    assert lex_positive((a_value[0] - q[0], a_value[1] - q[1]))
    for n in range(1, 500):
        # q+1/n>A, despite q<A, and the constant sequence has L1 error exactly 1/n.
        assert lex_positive((F(1, n), F(-1)))
    doubled_value = (-2 * a_value[0] - 2, -2 * a_value[1])
    assert doubled_value == (F(-1), F(-2))
    assert lex_positive((F(-1) - doubled_value[0], -doubled_value[1]))

    # A is the half-mixture of -2A and sure -2, atom by atom.
    for j in range(1, 40):
        probability = F(1, 2) if j == 1 else F(1, 2) * F(1, 2**(j - 1))
        payoff = -2 if j == 1 else -2 * (-2)**(j - 1)
        assert probability == F(1, 2**j)
        assert payoff == (-2)**j
    assert F(1, 2) * (-2 * q[0]) + F(1, 2) * (-2) == q[0]
    print('PASS: exact folded dyadic tails, both infinite-area witnesses, lexicographic inequalities, and recursion')


if __name__ == '__main__':
    main()

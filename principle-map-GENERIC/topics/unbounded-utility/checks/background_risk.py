"""Exact finite-law sanity checks; universal/infinite claims need the write-ups."""
from fractions import Fraction as F
from random import Random


def mix(x, y, p=F(1, 2)):
    return [(v, p*w) for v, w in x] + [(v, (1-p)*w) for v, w in y]


def survival(law, t):
    return sum((w for v, w in law if v > t), F(0))


def areas(x, y):
    points = sorted({v for v, _ in x+y})
    plus = minus = F(0)
    for a, b in zip(points, points[1:]):
        d = survival(x, a)-survival(y, a)
        plus += (b-a)*max(d, 0)
        minus += (b-a)*max(-d, 0)
    return plus, minus


def quantile(law, p):
    cumulative = F(0)
    for v, w in sorted(law):
        cumulative += w
        if cumulative >= p:
            return v
    raise AssertionError('invalid probability')


def quantile_grid(*laws):
    points = {F(0), F(1)}
    for law in laws:
        c = F(0)
        for _, w in sorted(law):
            c += w
            points.add(c)
        assert c == 1
    points = sorted(points)
    return [((a+b)/2, b-a) for a, b in zip(points, points[1:])]


def convolve(x, z):
    return [(v+t, p*q) for v, p in x for t, q in z]


def stp_survival(t):
    # Exact infinite-law tail P(P>t), with P(P=2^n)=2^-n.
    value, tail = F(2), F(1)
    while value <= t:
        tail /= 2
        value *= 2
    return tail


def main():
    rng = Random(20260909)
    def law():
        weights = [rng.randrange(1, 10) for _ in range(5)]
        return [(F(rng.randrange(-12, 13)), F(w, sum(weights))) for w in weights]
    for _ in range(100):
        x, y, z = law(), law(), law()
        ap, am = areas(x, y)
        assert ap-am == sum(v*w for v, w in x)-sum(v*w for v, w in y)
        grid = quantile_grid(x, y, z)
        qp = sum(w*max(quantile(x, u)-quantile(y, u), 0) for u, w in grid)
        qm = sum(w*max(quantile(y, u)-quantile(x, u), 0) for u, w in grid)
        assert (ap, am) == (qp, qm)
        xz = [(quantile(x, u)+quantile(z, u), w) for u, w in grid]
        yz = [(quantile(y, u)+quantile(z, u), w) for u, w in grid]
        assert areas(xz, yz) == (ap, am)
        assert areas(mix(x, z, F(2, 5)), mix(y, z, F(2, 5))) == (F(2, 5)*ap, F(2, 5)*am)
        cp, cm = areas(convolve(x, z), convolve(y, z))
        assert cp-cm == ap-am
        assert cp <= ap and cm <= am
        assert areas([(-v, w) for v, w in y], [(-v, w) for v, w in x]) == (ap, am)
    # Demonstrates overlap after convolution, not failure of cancellation itself.
    x, y, z = [(F(-1), F(1, 2)), (F(1), F(1, 2))], [(F(0), F(1))], [(F(0), F(1, 2)), (F(1), F(1, 2))]
    assert areas(x, y) == (F(1, 2), F(1, 2))
    assert areas(convolve(x, z), convolve(y, z)) == (F(1, 4), F(1, 4))
    # The antitonic witness's law is 1/2(P+2)+1/2 P. No truncation of P.
    thresholds = [F(-1), F(0), F(1), F(2), F(3), F(4)]
    thresholds += [F(2**n)+delta for n in range(2, 31) for delta in (-1, 0, 1, 2)]
    for t in thresholds:
        assert (stp_survival(t-2)+stp_survival(t))/2 >= stp_survival(t)
        assert stp_survival((t-2)/2) >= stp_survival(t/2)
    assert (stp_survival(F(1))+stp_survival(F(3)))/2 > stp_survival(F(3))
    for n in range(2, 31):
        # Two disjoint antitonic branches each have probability 2^-n.
        assert 2*F(1, 2**n) == F(1, 2**(n-1))
        assert 2**n+2 == 2*(2**(n-1))+2
    print('PASS: 100 exact area/quantile/mixture/convolution cases, overlap example, and exact St Petersburg tails.')


if __name__ == '__main__':
    main()

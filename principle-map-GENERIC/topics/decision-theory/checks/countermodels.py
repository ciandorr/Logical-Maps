#!/usr/bin/env python3
"""Finite sanity checks of the countermodels used in AI-produced independence
results for the decision-theory topic. These are NOT proofs — they test the
stated axioms on a random sample of lotteries over three outcomes so that a
mis-stated countermodel is caught early. Run:  python3 countermodels.py
"""
import math
import random

random.seed(1)
N = 4000
EPS = 1e-9


def lottery():
    a, b = sorted((random.random(), random.random()))
    return (a, b - a, 1 - b)


def mix(l, p, q):
    return tuple(l * x + (1 - l) * y for x, y in zip(p, q))


def check(name, pref, expect):
    """expect: dict axiom-name -> bool (True = should hold)."""
    P = [lottery() for _ in range(N)]
    found = {k: True for k in expect}
    for _ in range(N):
        p, q, r = random.choice(P), random.choice(P), random.choice(P)
        lam = random.uniform(0.05, 0.95)
        if not (pref(p, q) or pref(q, p)):
            found["completeness"] = False
        if pref(p, q) and pref(q, r) and not pref(p, r):
            found["transitivity"] = False
        if (pref(p, q) != pref(mix(lam, p, r), mix(lam, q, r))):
            found["independence"] = False
        strict = lambda x, y: pref(x, y) and not pref(y, x)
        if strict(p, q) and strict(q, r) and not strict(p, r):
            found["quasi-transitivity"] = False
        if strict(p, q) and strict(q, r) and strict(r, p):
            found["acyclicity"] = False
        if strict(p, q) and not (strict(p, mix(lam, p, q)) and strict(mix(lam, p, q), q)):
            found["betweenness"] = False
    ok = all(found[k] == v for k, v in expect.items())
    print(f"{'OK ' if ok else 'BAD'} {name}: " + ", ".join(f"{k}={'holds' if found[k] else 'fails'}" for k in expect))
    return ok


def main():
    all_ok = True

    # cone-independence-continuity-not-transitivity ------------------------
    # Difference space of Δ({a,b,c}) is the plane {x : Σx = 0}; use coordinates
    # (x1, x2) = (p_a - q_a, p_b - q_b). C = closed upper half-plane ∪ sector [225°,270°].
    def in_cone(x1, x2):
        ang = math.degrees(math.atan2(x2, x1)) % 360
        if abs(x1) < EPS and abs(x2) < EPS:
            return True
        return x2 >= -EPS or (225 - 1e-7 <= ang <= 270 + 1e-7)

    def cone_pref(p, q):
        return in_cone(p[0] - q[0], p[1] - q[1])

    all_ok &= check("cone model (⇏ transitivity)", cone_pref,
                    {"completeness": True, "independence": True, "transitivity": False})

    # semiorder-not-transitive ---------------------------------------------
    u = (1.0, 0.5, 0.0)
    eu = lambda p: sum(x * y for x, y in zip(p, u))
    eps = 0.1
    semi = lambda p, q: eu(p) >= eu(q) - eps
    all_ok &= check("semiorder (⇏ transitivity)", semi,
                    {"completeness": True, "quasi-transitivity": True, "transitivity": False,
                     "independence": False})

    # acyclic-not-quasi-transitive ------------------------------------------
    # p ≻ q iff eu(p) - eu(q) ∈ (ε, 2ε];  p ≽ q iff not q ≻ p.
    def strict_band(p, q):
        d = eu(p) - eu(q)
        return eps < d <= 2 * eps
    band = lambda p, q: not strict_band(q, p)
    all_ok &= check("band model (⇏ quasi-transitivity)", band,
                    {"completeness": True, "acyclicity": True, "quasi-transitivity": False})

    print("all countermodel checks passed" if all_ok else "SOME CHECKS FAILED")
    return all_ok


if __name__ == "__main__":
    raise SystemExit(0 if main() else 1)

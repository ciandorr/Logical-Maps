"""Indexing checks for the alternating-shell BC-t counterexamples.

These finite prefixes check the explicit arrows used in the write-ups.
They do not prove infinite surjectivity or absence of a least upper bound;
those arguments are given in the handwritten model proofs.
"""


def check_shells():
    checked = 0
    for n in range(1, 80):
        limit = 3 * n + 10
        cases = (
            (lambda m: m, lambda m: m if m <= n else m - 1, True, False),
            (lambda m: 0, lambda m: 0 if m <= n else 1, False, True),
            (lambda m: max(m - 1, 0),
             lambda m: max(m - 1, 0) if m <= n else max(m - 2, 0), True, True),
        )
        for base, witness, surjective_tail, collapses in cases:
            values = [witness(m) for m in range(limit)]
            assert all(witness(m) == base(m) for m in range(n + 1))
            assert witness(n + 1) != base(n + 1)
            assert all(a <= b for a, b in zip(values, values[1:]))
            if collapses:
                assert values[0] == values[1]
            if surjective_tail:
                assert values[0] == 0
                assert set(values) == set(range(values[-1] + 1))
                assert all(values[m + 1] == values[m] + 1
                           for m in range(n + 1, limit - 1))
            checked += 1
    return checked


if __name__ == '__main__':
    print(f'Checked {check_shells()} strict-shell witnesses and their monotone tails.')

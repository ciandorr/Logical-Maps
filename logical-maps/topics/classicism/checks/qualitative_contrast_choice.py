"""Exhaust the finite symmetry obstruction to choosing from unordered pairs.

Run from logical-maps/ with:
    python3 topics/classicism/checks/qualitative_contrast_choice.py

These are finite proxies for the support argument in the qualitative-contrast
write-up, not finite models of its infinite higher-order construction. Every
finite set admits selectors. The check finds how large their supports must be.
"""

from itertools import combinations, product


def main():
    tested = 0
    for size in range(2, 6):
        pairs = tuple(combinations(range(size), 2))
        selectors = tuple(dict(zip(pairs, values)) for values in product(*pairs))
        # Transpositions generate the pointwise stabilizer of each support.
        # By relabelling, it is enough to check the initial support of each size.
        counts = []
        for support_size in range(size + 1):
            transpositions = []
            for a, b in combinations(range(support_size, size), 2):
                permutation = list(range(size))
                permutation[a], permutation[b] = b, a
                transpositions.append(permutation)

            count = 0
            for selector in selectors:
                invariant = all(
                    selector[tuple(sorted(permutation[x] for x in pair))]
                    == permutation[selector[pair]]
                    for permutation in transpositions
                    for pair in pairs
                )
                count += invariant
                tested += 1
            counts.append(count)

        assert counts == [0] * (size - 1) + [len(selectors)] * 2, counts
        print(f'{size} individuals: {len(selectors)} pair selectors; '
              f'minimum support size {size - 1}.')
    print(f'PASS: {tested} selector/support cases; no support leaves two individuals outside it.')


if __name__ == '__main__':
    main()

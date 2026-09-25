"""Exact finite checks for the full action model on {1, k}, k squared = k.

Enumerates the actual four-proposition domain and target-domain quantifiers.
This is a finite mathematical sanity check, not Lean verification or a proof
of the infinite truncation/rounding cases.
"""
from itertools import product


ARROWS = ("1", "k")
TOP = frozenset(ARROWS)
BOTTOM = frozenset()
PROPOSITIONS = tuple(frozenset(a for a, present in zip(ARROWS, bits) if present)
                     for bits in product((False, True), repeat=2))


def compose(left, right):
    return "1" if left == right == "1" else "k"


def shift(arrow, proposition):
    return frozenset(u for u in ARROWS if compose(u, arrow) in proposition)


def strong_world(proposition, *, restrict_target=False):
    if not proposition:
        return False
    for arrow in ARROWS:
        transported = shift(arrow, proposition)
        domain = ({shift(arrow, p) for p in PROPOSITIONS}
                  if restrict_target else PROPOSITIONS)
        for target in domain:
            if not (transported <= target or transported <= TOP - target):
                return False
    return True


def strong_leibniz(*, restrict_target=False):
    worlds = [w for w in PROPOSITIONS if strong_world(w, restrict_target=restrict_target)]
    return all(not p or any(w <= p for w in worlds) for p in PROPOSITIONS)


def barcan_instance(extensions):
    antecedent = all(shift(h, p) in extensions[h]
                     for p in PROPOSITIONS for h in ARROWS)
    consequent = all(p in extensions[h] for h in ARROWS for p in PROPOSITIONS)
    return antecedent, consequent


def main():
    assert len(PROPOSITIONS) == 4
    one, kay = frozenset({"1"}), frozenset({"k"})
    assert shift("k", one) == BOTTOM
    assert shift("k", kay) == TOP
    assert {w for w in PROPOSITIONS if strong_world(w)} == {one}
    assert not strong_leibniz()
    assert not any(strong_world(w) and w <= kay for w in PROPOSITIONS)
    # A free strong-world predicate need not remain true of its transported
    # argument: {1} becomes impossible after k.
    assert strong_world(one) and not strong_world(shift("k", one))

    # This reproduces the specific mistaken quantifier reading in the drafts.
    assert {w for w in PROPOSITIONS if strong_world(w, restrict_target=True)} == {one, kay}
    assert strong_leibniz(restrict_target=True)

    witness = {"1": frozenset(PROPOSITIONS), "k": frozenset({BOTTOM, TOP})}
    assert barcan_instance(witness) == (True, False)
    # Full type-tt intensions choose an extension independently at each arrow.
    # Exhaust all 2^(2*4)=256 intensions, with an independently quantified
    # successor proposition in the consequent.
    counterexamples = 0
    for bits in product((False, True), repeat=8):
        extensions = {h: frozenset(p for p, present in zip(PROPOSITIONS, bits[4*i:4*i+4]) if present)
                      for i, h in enumerate(ARROWS)}
        counterexamples += barcan_instance(extensions) == (True, False)
    assert counterexamples == 3
    print("Checked all 4 propositions: exactly one strong world; Strong Leibniz fails.")
    print("Checked all 256 property intensions: exactly 3 BF counterexamples, including the stated witness.")
    print("The incorrect transported-domain quantifier instead makes Strong Leibniz true.")


if __name__ == "__main__":
    main()

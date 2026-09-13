#!/usr/bin/env python3
"""Finite propositional checks for the explicit full-frame countermodels.

This checks the full propositional domains, not a finite approximation to all
higher types. Higher-type existence is supplied by the full-model construction
and the handwritten proofs. No finite truncation certifies the infinite models.
Run from logical-maps/: python3 topics/intuitionisticism/checks/finite_frames.py
"""
from itertools import product


class Frame:
    def __init__(self, informational, metaphysical):
        self.i = tuple(map(frozenset, informational))
        self.m = tuple(map(frozenset, metaphysical))
        self.w = frozenset(range(len(self.i)))
        for relation in (self.i, self.m):
            assert all(w in relation[w] for w in self.w)
            assert all(relation[v] <= relation[w]
                       for w in self.w for v in relation[w])
        assert all(self.i[w] <= self.m[w] for w in self.w)
        self.props = [frozenset(w for w, yes in enumerate(bits) if yes)
                      for bits in product((False, True), repeat=len(self.w))]
        self.props = [p for p in self.props if all(self.i[w] <= p for w in p)]
        self.bot = frozenset()

    def imp(self, p, q):
        return frozenset(w for w in self.w if self.i[w] & p <= q)

    def neg(self, p):
        return self.imp(p, self.bot)

    def nn(self, p):
        return self.neg(self.neg(p))

    def box(self, p):
        return frozenset(w for w in self.w if self.m[w] <= p)

    def eq(self, p, q):
        return frozenset(w for w in self.w if self.m[w] & p == self.m[w] & q)

    def distinct(self, p):
        return self.neg(self.eq(p, self.bot))

    def forall(self, values):
        result = self.w
        for p in values:
            result &= p
        return result

    def laws(self):
        ps = self.props
        return {
            'excluded-middle': self.forall(p | self.neg(p) for p in ps),
            'weak-excluded-middle': self.forall(self.neg(p) | self.nn(p) for p in ps),
            'bottom-identity-stability': self.forall(
                self.imp(self.nn(self.eq(p, self.bot)), self.eq(p, self.bot)) for p in ps),
            'self-necessitation': self.forall(self.imp(p, self.box(p)) for p in ps),
            'propositional-extensionality': self.forall(
                self.imp(self.imp(p, q) & self.imp(q, p), self.eq(p, q)) for p in ps for q in ps),
            'nonfalsity-disjunction': self.forall(
                self.imp(self.nn(p | q), self.nn(p) | self.nn(q)) for p in ps for q in ps),
            'ps-c-distinct-from-bottom': self.forall(
                self.imp(self.distinct(p | q), self.distinct(p) | self.distinct(q)) for p in ps for q in ps),
            'nonfalsity-distinct-disjunction': self.forall(
                self.imp(self.nn(p | q), self.distinct(p) | self.distinct(q)) for p in ps for q in ps),
        }


def main():
    fork = Frame([{0, 2}, {1}, {2}], [{0, 1, 2}, {1}, {2}])
    p = frozenset({1})
    assert fork.eq(p, fork.bot) == {2}
    assert 0 in fork.nn(fork.eq(p, fork.bot))
    assert 0 not in fork.eq(p, fork.bot)
    assert 0 not in fork.laws()['excluded-middle']

    branching = Frame([{0, 1, 2}, {1}, {2}], [{0, 1, 2}, {1}, {2}])
    laws = branching.laws()
    for name in ['propositional-extensionality', 'self-necessitation', 'bottom-identity-stability']:
        assert laws[name] == branching.w, name
    for name in ['weak-excluded-middle', 'excluded-middle', 'nonfalsity-disjunction',
                 'ps-c-distinct-from-bottom', 'nonfalsity-distinct-disjunction']:
        assert 0 not in laws[name], name

    classical = Frame([{0}, {1, 2}, {2}], [{0, 1, 2}, {1, 2}, {2}])
    lem = classical.laws()['excluded-middle']
    assert 0 in lem and 1 not in lem
    assert 0 not in classical.box(lem)
    p = frozenset({0, 2})
    assert classical.neg(p) == classical.bot
    assert 0 in classical.box(classical.nn(p))
    assert 0 in classical.neg(classical.eq(p, classical.w))

    # Standing □ laws and the bottom/necessary-falsehood identity on all inputs.
    for frame in (fork, branching, classical):
        for p in frame.props:
            assert frame.eq(p, frame.bot) == frame.box(frame.neg(p))
            assert frame.box(p) <= p
            assert frame.box(p) <= frame.box(frame.box(p))
            for q in frame.props:
                assert frame.box(frame.imp(p, q)) & frame.box(p) <= frame.box(q)
    print('Finite full-frame propositional checks passed (3 frames, all propositional inputs).')


if __name__ == '__main__':
    main()

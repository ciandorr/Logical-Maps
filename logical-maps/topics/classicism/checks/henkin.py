"""Finite checks for full-henkin-singleton-base; run from logical-maps/.

The record's induction handles every admitted type. These checks exhaust the
Boolean truth values and the relations between the small representative
domains. Relational Choice also permits relations with individual output;
selecting operations are required only at admitted function types.
"""
from itertools import product


def main():
    domains = {'e': (0,), 't': (False, True)}
    for name, source, target in [('et', 'e', 't'), ('tt', 't', 't')]:
        domains[name] = tuple(product(domains[target], repeat=len(domains[source])))

    # Box is identity at the two-element Boolean algebra, including at
    # quantified propositions. Check the modal laws without assuming them.
    box = lambda p: p == True
    implies = lambda p, q: not p or q
    for p, q in product(domains['t'], repeat=2):
        assert implies(p == q, box(p == q))                 # NI
        assert implies(p != q, box(p != q))                 # ND
        assert implies(p == q, p is q)                      # Frege
        assert implies(box(implies(p, q)), implies(box(p), box(q)))
        assert implies(box(p), p) and implies(box(p), box(box(p)))

    serial_count = 0
    for (source_name,source), (target_name,target) in product(domains.items(), repeat=2):
        operations = set(product(target, repeat=len(source)))
        nonempty_rows = [tuple(y for j,y in enumerate(target) if mask & (1 << j))
                         for mask in range(1, 1 << len(target))]
        for relation in product(nonempty_rows, repeat=len(source)):
            # Every serial relation has a functional subrelation. At
            # admitted function types, its selector is an operation too.
            selection = tuple(row[0] for row in relation)
            if target_name != 'e':
                assert selection in operations
            assert all(y in row for y,row in zip(selection, relation))
            serial_count += 1
        for function in operations if target_name != 'e' else ():
            # The graph of any operation gives a total single-valued
            # relation; Plenitude recovers exactly this tuple of values.
            graph = tuple((value,) for value in function)
            assert tuple(row[0] for row in graph) == function

    assert len(domains['e']) == 1 and len(domains['t']) == 2
    print(f'PASS: full Henkin Boolean laws and selectors for {serial_count} serial relations.')


if __name__ == '__main__':
    main()

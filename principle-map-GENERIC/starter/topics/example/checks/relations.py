"""Check the tutorial's concrete models and finite instances of proved rules."""
from itertools import product
from pathlib import Path
import yaml


def properties(size, relation):
    objects = range(size)
    reflexive = all((x, x) in relation for x in objects)
    symmetric = all((y, x) in relation for x, y in relation)
    transitive = all((x, z) in relation for x, y in relation for v, z in relation if y == v)
    connected = all(x == y or (x, y) in relation or (y, x) in relation for x in objects for y in objects)
    return dict(reflexive=reflexive, symmetric=symmetric, transitive=transitive,
                equivalence=reflexive and symmetric and transitive, connected=connected)


def main():
    topic = Path(__file__).resolve().parent.parent
    models = {'identity-on-two': (2, {(0, 0), (1, 1)}), 'strict-chain-on-two': (2, {(0, 1)})}
    for mid, (size, relation) in models.items():
        record = yaml.safe_load((topic / 'models' / f'{mid}.yaml').read_text())
        flags = properties(size, relation)
        assert all(flags[p] for p in record['satisfies']), mid
        assert all(not flags[p] for p in record['violates']), mid
    rules = [yaml.safe_load(p.read_text()) for p in (topic / 'results').glob('*.yaml')]
    checked = 0
    for size in range(1, 4):
        pairs = list(product(range(size), repeat=2))
        for mask in range(1 << len(pairs)):
            flags = properties(size, {pair for i, pair in enumerate(pairs) if mask & (1 << i)})
            for rule in rules:
                if rule['status'] == 'proved' and all(flags[p] for p in rule['premises']):
                    assert flags.get(rule['conclusion'], False), rule['id']
            checked += 1
    print(f'PASS: two concrete models and all proved rules on {checked} finite relations.')


if __name__ == '__main__':
    main()

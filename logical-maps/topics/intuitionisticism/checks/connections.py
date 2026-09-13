#!/usr/bin/env python3
"""Audit the recorded modal connections and their scope boundaries.

This checks the database consequences, source/status metadata, and naming. It
does not replace the mathematical proofs in the individual result records.
Run from logical-maps/: python3 topics/intuitionisticism/checks/connections.py
"""
from pathlib import Path
import sys

import yaml

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(ROOT / 'scripts'))
import pmap


def main():
    topic = ROOT / 'topics/intuitionisticism'
    data = pmap.load_topic('intuitionisticism')
    principles = {p['id']: p for p in data['principles']}
    records = {r['id']: r for r in data['results']}
    audit = yaml.safe_load((topic / 'connections.yaml').read_text())
    boxed = audit['boxed_counterparts']
    engine = pmap.Engine(
        principles, [r for r in data['results'] if r['status'] == 'proved'],
        [m for m in data['models'] if m['status'] == 'proved'],
    )
    assert not engine.model_conflicts, engine.model_conflicts
    assert engine.conflict([]) is None
    for base, box in boxed.items():
        assert principles[box]['name'].startswith('□'), box
        assert '[]' + principles[base]['name'] in principles[box]['aliases'], box
        assert engine.entails([box], base)[0], (box, base)
    assert principles['excluded-middle']['name'] == 'LEM'
    assert principles['necessary-excluded-middle']['name'] == '□LEM'
    assert principles['descriptions']['name'] == '□Descriptions'
    assert principles['unnecessitated-descriptions']['name'] == 'Descriptions'

    for a, b in [
        ('vee-married', 'vee-equals-two'),
        ('vee-married', boxed['vee-married']),
        ('vee-equals-two', boxed['vee-entails-two']),
        ('necessary-ps-d-possibility-vee', 'necessities-equal'),
        (boxed['ps-d-possibility-two'], 'necessities-equal'),
        (boxed['ps-c-distinct-from-bottom'], 'vee-equals-distinct'),
        ('propositional-extensionality', 'self-necessitation'),
        (boxed['propositional-extensionality'], boxed['self-necessitation']),
        ('necessity-two-intensionalism', 'two-entails-necessity'),
        (boxed['necessity-two-intensionalism'], 'necessities-equal'),
        ('vee-equals-truth', boxed['vee-entails-truth']),
        ('two-equals-truth', boxed['two-entails-truth']),
        ('infinity-equals-truth', boxed['infinity-entails-truth']),
    ]:
        assert engine.entails([a], b)[0], (a, b)
        assert engine.entails([b], a)[0], (b, a)
    assert engine.entails([], 'two-entails-vee')[0]
    assert engine.entails([], 'modalized-functionality')[0]
    for short in ['vee', 'two', 'infinity']:
        assert engine.entails([], short + '-entails-distinct')[0]

    # These are boundaries of the CURRENT RECORDED proofs, not new
    # mathematical nonimplication assertions.
    for assumptions, conclusion in [
        ([], 'necessary-excluded-middle'),
        (['excluded-middle'], 'necessary-excluded-middle'),
        (['weak-excluded-middle'], 'necessary-weak-excluded-middle'),
        (['ps-c-distinct-from-bottom'], boxed['ps-c-distinct-from-bottom']),
        (['vee-entails-two'], 'vee-equals-two'),
        (['two-entails-necessity'], 'necessities-equal'),
        (['infinity-married'], 'infinity-equals-two'),
        (['infinity-married'], 'infinity-entails-two'),
        ([], 'infinitary-type-reduction'),
        ([], 'four-possibility-two'),
    ]:
        assert not engine.entails(assumptions, conclusion)[0], (assumptions, conclusion)
    assert engine.entails(
        ['infinity-married', 'necessary-ps-c-possibility-infinity'],
        'infinity-entails-two',
    )[0]
    # The existing tree still witnesses equality of possibilities without
    # equality of necessities; the new equivalences must preserve it.
    assert 'vee-equals-two' in engine.holds['full-binary-tree-canopy']
    assert 'necessities-equal' in engine.fails['full-binary-tree-canopy']

    completed = records['ii-implies-modalized-functionality']
    assert completed['status'] == 'proved' and completed['was_conjectured']
    assert completed['certificate']['source_id'] == 'classicism-2024'
    for id in audit['new_results']:
        record = records[id]
        assert record['proof'].strip() and record['status'] == 'proved', id
        assert record['certificate']['lean'] == 'none', id
        assert record['certificate']['checked_by'] == [], id
        assert len(record['source_names']) == len(record['sources']), id
        if id.startswith('boxed-lift-'):
            original = records[id.removeprefix('boxed-lift-')]
            assert original['status'] == 'proved', id
            assert record['premises'] == [boxed[p] for p in original['premises']], id
            assert record['conclusion'] == boxed[original['conclusion']], id
    print('PASS: boxed naming, recorded equivalences, scope boundaries, proof history, and all existing models.')


if __name__ == '__main__':
    main()

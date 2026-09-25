"""Regression checks for Horn implications to False and Python/viewer agreement.

Run with the project Python and Node installed. No browser packages needed.
The tiny truth tables below are test oracles; production never enumerates them.
"""
from itertools import combinations
from pathlib import Path
from random import Random
import json
import subprocess
import tempfile
from unittest.mock import patch

import pmap


def powerset(xs):
    return [list(c) for n in range(len(xs)+1) for c in combinations(xs, n)]


def summary(e, seeds):
    ids = e.ids
    return {
        'pairs': [[a, b, e.pair(a,b)['status']] for a in ids for b in ids if a != b],
        'holds': {m['id']: sorted(e.holds[m['id']]) for m in e.models},
        'fails': {m['id']: sorted(e.fails[m['id']]) for m in e.models},
        'invalid': sorted(e.model_conflicts),
        'packages': [e.package(p) for p in seeds],
    }


def main():
    rng = Random(902026)
    ids = list('abcd')
    subsets = powerset(ids)
    fixtures = []
    for n in range(40):
        rules = []
        for j in range(7):
            prem = rng.choice(subsets)
            conclusion = rng.choice(ids + [pmap.FALSE]*2)
            if conclusion in prem:
                continue
            rules.append(dict(id=f'r{n}-{j}', premises=prem, conclusion=conclusion))
        bg = rng.choice(subsets)
        negative_bg = rng.choice(subsets) if n % 2 else []
        models = [dict(id='m', satisfies=rng.choice(subsets), violates=rng.sample(ids, rng.randrange(3)))]
        fixture = dict(ids=ids, rules=rules, models=models, background=bg, negative_background=negative_bg, probes=subsets)
        fixtures.append(fixture)
        e = pmap.Engine(ids, rules, models, bg, negative_bg)
        valuations = [set(v) for v in subsets if set(bg) <= set(v) and not set(negative_bg) & set(v) and all(
            not set(r['premises']) <= set(v) or r['conclusion'] in v for r in rules)]
        for seed in subsets:
            valid = [v for v in valuations if set(seed) <= v]
            assert (e.conflict(seed) is not None) == (not valid)
            for c in ids:
                if valid:
                    assert e.entails(seed,c)[0] == all(c in v for v in valid)
                    assert (e.excludes(seed,c) is not None) == all(c not in v for v in valid)
                else:
                    assert not e.entails(seed,c)[0], 'No consequences by explosion'
                    assert e.excludes(seed,c) is None
        model = models[0]
        matching = [v for v in valuations if set(model['satisfies']) <= v and not set(model['violates']) & v]
        assert ('m' in e.model_conflicts) == (not matching)
        if matching:
            for c in ids:
                assert (c in e.fails['m']) == all(c not in v for v in matching)
    # Compare both topic datasets too, without exponential truth-table enumeration.
    for topic in pmap.list_topics():
        data = pmap.load_topic(topic)
        topic_ids = [p['id'] for p in data['principles']]
        rules = [r for r in data['results'] if r['status'] == 'proved']
        models = [m for m in data['models'] if m['status'] == 'proved']
        fixtures.append(dict(ids=topic_ids,rules=rules,models=models,background=data['topic'].get('background',[]),
                             probes=[[], *[[p] for p in topic_ids], *[r['premises'] for r in rules]]))
    template = pmap.TEMPLATE.read_text()
    js = template[template.index('function closure('):template.index('// ---------------------------------------------------------------- state')]
    harness = '''
const vm=require('node:vm'),fs=require('node:fs');
const input=JSON.parse(fs.readFileSync(0,'utf8'));
const context=vm.createContext({});
vm.runInContext('const FALSE="false";'+input.code+';globalThis.Engine=Engine;',context);
const output=input.fixtures.map(f=>{
 const e=new context.Engine(f.ids,f.rules,f.models,f.background,f.negative_background || []);
 const pack=p=>{const r=e.package(p);for(const k of ['entails','excludes','separated','open'])r[k]=r[k].map(x=>x[0]);return r;};
 return {pairs:f.ids.flatMap(a=>f.ids.filter(b=>b!==a).map(b=>[a,b,e.pair(a,b).status])),
 holds:Object.fromEntries([...e.holds].map(([k,v])=>[k,[...v].sort()])),
 fails:Object.fromEntries([...e.fails].map(([k,v])=>[k,[...v].sort()])),
 invalid:[...e.modelConflicts.keys()].sort(),packages:f.probes.map(pack)};
});
process.stdout.write(JSON.stringify(output));
'''
    actual = json.loads(subprocess.run(['node','-e',harness],input=json.dumps({'code':js,'fixtures':fixtures}),capture_output=True,text=True,check=True).stdout)
    expected = [summary(pmap.Engine(f['ids'], f['rules'], f['models'], f['background'], f.get('negative_background', [])), f['probes']) for f in fixtures]
    assert actual == expected, 'Python and browser engines disagree'
    # Test actual generated Lean text, not merely the coverage count.
    with tempfile.TemporaryDirectory() as d:
        root = Path(d); (root/'Test').mkdir()
        data = dict(topic={'lean_lib':'Test'}, principles=[dict(id='a',name='A',lean_def='Test.A')],
                    results=[dict(id='incompatible',premises=['a'],conclusion=pmap.FALSE,status='proved')],
                    models=[dict(id='w',name='W',satisfies=['a'],violates=[],status='proved')])
        with patch.object(pmap,'load_topic',return_value=data), patch.object(pmap,'lean_lib_dir',return_value=(root,'Test')):
            generated = pmap.generate_lean_statements('fixture').read_text()
        # Without a declared shape, principles are plain propositions.
        assert 'import Test.Principles\n' in generated and 'example : Prop := Test.A' in generated
        assert 'def incompatible : Prop :=\n  Test.A →\n  False' in generated and 'def w : Prop :=\n  Test.A' in generated
        assert 'False P' not in generated
        # A topic declares its own shape; the tooling knows no framework.
        data['topic']['lean'] = {'imports': ['Test.Core'], 'namespace': 'Test', 'definition_check': 'example (P : Pref) : Prop :=\n  {def} P',
                                 'result': {'binder': '∀ (P : Pref),', 'principle': '{def} P'}, 'model': {'binder': '∃ W : Witness,', 'principle': '{def} W.pref'}}
        with patch.object(pmap,'load_topic',return_value=data), patch.object(pmap,'lean_lib_dir',return_value=(root,'Test')):
            generated = pmap.generate_lean_statements('fixture').read_text()
        assert 'import Test.Core\n' in generated and 'example (P : Pref) : Prop :=\n  Test.A P' in generated
        assert 'def incompatible : Prop :=\n  ∀ (P : Pref),\n    Test.A P →\n    False' in generated
        assert 'def w : Prop :=\n  ∃ W : Witness,\n    Test.A W.pref' in generated
    print(f'PASS: 40 exhaustive Horn theories with positive/negative backgrounds, topic Python/JavaScript parity, model conflicts, and native Lean False generation.')


if __name__ == '__main__':
    main()

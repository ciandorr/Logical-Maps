#!/usr/bin/env python3
"""Check catalogue validation and reference exports without altering topic records."""
import contextlib
import copy
import io
from unittest.mock import patch
import pmap

original = pmap.load_topic('unbounded-utility')

def validate(data):
    with patch.object(pmap, 'load_topic', return_value=data), contextlib.redirect_stdout(io.StringIO()):
        return pmap.validate_topic('unbounded-utility', quiet=True)

assert validate(original)
for mutate in [
    lambda d: d['principles'][0].update(references=[{'paper': 'missing-paper', 'role': 'origin'}]),
    lambda d: d['principles'][0].update(references=[{'paper': d['papers'][0]['id'], 'role': 'verified'}]),
    lambda d: d['papers'].append(copy.deepcopy(d['papers'][0])),
    lambda d: d['papers'][0].update(url='javascript:alert(1)'),
    lambda d: d.update(paper_catalogue={'papers': 'invalid'}),
    lambda d: d.update(paper_catalogue=[]),
]:
    data = copy.deepcopy(original)
    mutate(data)
    assert not validate(data), 'Malformed catalogue/reference was accepted'

presentation = pmap.enriched_payload('unbounded-utility', {})
assert 'Source literature' in presentation['background_html']
assert 'Other relevant literature' in presentation['background_md']
assert presentation['background_html'].count('id="paper-catalogue"') == 1
payload = pmap.export_json('unbounded-utility')
assert payload['papers'] == original['papers']
assert pmap.export_json('decision-theory')['papers'] == [], 'Legacy topics need no catalogue'
principle = next(p for p in payload['principles'] if p['id'] == 'independent-sum-consistency')
assert any(r['paper'] == 'wilkinson-2025' and r['role'] == 'origin' for r in principle['references'])
assert 'mutually independent' in pmap.paper_references_md(principle, original)
results = {r['id']: r for r in payload['results']}
for result, source in {
    'dominance-refutes-full-sum': 'seidenfeld-schervish-kadane-2009',
    'rich-simple-sure-thing-refutes-countable': 'russell-isaacs-2021',
}.items():
    assert results[result]['certificate']['source_id'] == source
    assert any(r['paper'] == source and r['role'] in ('proof', 'origin') for r in results[result]['references'])
    assert next(s for s in payload['topic']['source_catalog'] if s['id'] == source)['kind'] == 'published-paper'
assert results['symmetric-dtu-refutes-independent-sum-candidate']['certificate']['source_id'] == 'misc'
assert all(r['certificate']['source_id'] != 'wilkinson-2025' for r in payload['results'])
assert results['full-sum-implies-independent']['certificate']['source_id'] == 'misc'
assert results['levy-refutes-neutral-independent-preservation']['certificate']['source_id'] == 'misc'
principles = {p['id']: p for p in payload['principles']}
for principle, label in {'countable-sure-thing': 'Russell & Isaacs', 'relative-expectation': 'Colyvan',
                         'independent-sum-consistency': 'Wilkinson', 'full-sum-consistency': 'Seidenfeld'}.items():
    assert label in principles[principle]['source_names'][0]
print('PASS: catalogue IDs, roles, URLs, legacy topics, export, and distinct origin/proof attribution.')

// The Background as pages: the list of pages, items with their Lean and what refers to them,
// [[id]] links both ways, #background/<page>/<item> routes, and the Literature page.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {execFileSync} = require('node:child_process');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const prepared = JSON.parse(execFileSync('python3', ['-c', String.raw`
import json, tempfile, pathlib
from scripts.pmap import theme_head, load_background, render_background, background_errors
t = pathlib.Path(tempfile.mkdtemp())
(t / 'background').mkdir()
(t / 'background' / 'first.md').write_text(r'''# First page

Some prose citing [[later-lemma]] and [[r|the result]]. A partial order {lean: Example.le_refl, Example.le_trans}, but not $\{lean: x\}$.

::: definition {#box-def}
title: necessity
---
Put $\Box p:=(p=\top)$.
:::
''')
(t / 'background' / 'second.md').write_text(r'''# Second page

::: lemma {#later-lemma}
title: a lemma
lean: Example.later_lemma
credit: Someone, 1 January 2026
sources: A paper, p. 2
---
It uses [[box-def]]. *Proof.* Obvious.
:::
''')
topic = {'background_pages': ['first', 'second']}
bg = load_background(t, topic)
assert not background_errors({'background': bg}, {'p', 'r'}), background_errors({'background': bg}, {'p', 'r'})
assert bg['pages'][0]['lean_inline'] == ['Example.le_refl', 'Example.le_trans'], bg['pages'][0]['lean_inline']
bad = load_background(t, {'background_pages': ['first']})
assert any('not listed' in e for e in bad['errors'])
out = render_background(bg, {'principles': [], 'results': [], 'models': [], 'papers': [{'id': 'paper', 'title': 'A paper', 'citation': 'Someone, A paper (2026).'}]})
print(json.dumps({'head': theme_head('unbounded-utility', math_path=None), **out}))
`], {cwd: root, encoding: 'utf8', maxBuffer: 2e6}));
const certificate = {source_id: 'paper', lean: 'none'};
prepared.items.find(i => i.id === 'later-lemma').lean_links = [{label: 'later_lemma', url: 'https://lean.example/L.lean#L1-L3'}];
prepared.items.find(i => i.id === 'later-lemma').lean_status = 'verified';
const data = {
  topic: {id: 'bg', title: 'Background pages', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  papers: [{id: 'paper', title: 'A paper', citation: 'Someone, A paper (2026).'}],
  principles: [{id: 'p', name: 'P', statement: 'P.'}, {id: 'q', name: 'Q', statement: 'Q.'}],
  results: [{id: 'r', premises: ['p'], conclusion: 'q', status: 'proved', certificate, proof: 'By [[later-lemma]].'}],
  models: [],
  background_pages: prepared.pages, background_items: prepared.items,
  background_lean: {'Example.le_refl': {link: {label: 'le_refl', url: 'https://lean.example/O.lean#L1-L2'}, theory: 'C⁻'}, 'Example.le_trans': {link: {label: 'le_trans', url: 'https://lean.example/O.lean#L3-L4'}, theory: 'C⁻'}}
};
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(String(e)));
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const dom = new JSDOM('<!doctype html>' + template.replace('<!--__PMAP_THEME__-->', () => prepared.head).replace('/*__PMAP_DATA__*/null', () => JSON.stringify(data)), {
  runScripts: 'dangerously', pretendToBeVisual: true, url: 'https://maps.example/bg/#background/second/later-lemma', virtualConsole: vc
});
const w = dom.window, d = w.document;
const text = el => el.textContent.replace(/\s+/g, ' ').trim();
const shown = () => [...d.querySelectorAll('#background [data-bg-page]')].filter(a => !a.hidden).map(a => a.dataset.bgPage);
(async () => {
  await new Promise(r => d.addEventListener('DOMContentLoaded', r, {once: true}));
  assert.deepEqual([...d.querySelectorAll('#background [data-bg-nav]')].map(a => a.textContent), ['First page', 'Second page', 'Literature']);
  assert.equal(d.querySelector('.tab[data-tab="background"]').getAttribute('aria-selected'), 'true', 'A #background route opens the tab');
  assert.deepEqual(shown(), ['second'], 'and the page it names');
  const lemma = d.getElementById('bg-later-lemma');
  assert.equal(text(lemma.querySelector('.bg-item-head')), 'Lemma (a lemma)');
  assert.equal(text(lemma.querySelector('.bg-meta')), 'Credit: Someone, 1 January 2026 · Sources: A paper, p. 2');
  assert.ok(lemma.querySelector('.badge.lean.verified'), 'A verified item shows the Lean badge');
  assert.equal(lemma.querySelector('.bg-item-foot .lean-pop a').href, 'https://lean.example/L.lean#L1-L3', 'Its menu links the declaration');
  assert.ok(!/later_lemma/.test(text(lemma.querySelector('.bg-item-foot')).replace(text(lemma.querySelector('.lean-pop')), '')), 'whose name appears only in the menu');
  const badge = lemma.querySelector('[data-lean-menu]'), menu = lemma.querySelector('.lean-pop');
  assert.equal(menu.hidden, true, 'The menu starts closed');
  badge.click();
  assert.equal(menu.hidden, false, 'The badge opens it');
  assert.equal(badge.getAttribute('aria-expanded'), 'true');
  d.body.click();
  assert.equal(menu.hidden, true, 'A click elsewhere closes it');
  badge.click(); badge.click();
  assert.equal(menu.hidden, true, 'and so does a second click on the badge');
  const refs = [...lemma.querySelectorAll('.bg-refs li button')].map(b => b.dataset.openResult || b.dataset.openBackground);
  assert.deepEqual(refs.sort(), ['first', 'r'], 'Referenced by: the result and the first page’s prose');
  assert.equal(d.querySelectorAll('#background .xref-slot').length, 0, 'Every slot became a link');
  // A link from an item to a definition on another page opens that page at it.
  lemma.querySelector('button[data-open-background="box-def"]').click();
  assert.deepEqual(shown(), ['first']);
  assert.equal(w.location.hash, '#background/first/box-def');
  assert.ok(d.querySelector('#bg-box-def .katex'), 'Maths in items is typeset');
  assert.equal(d.querySelector('#bg-page-first button[data-open-result="r"]').textContent, 'the result', 'A labelled link keeps its label');
  const inline = d.querySelectorAll('#bg-page-first .lean-ref');
  assert.equal(inline.length, 1, 'One citation, and none inside maths');
  assert.deepEqual([...inline[0].querySelectorAll('.lean-pop a')].map(a => a.textContent), ['le_refl', 'le_trans'], 'One menu for both declarations');
  assert.equal(text(inline[0]).replace(text(inline[0].querySelector('.lean-pop')), ''), 'Lean ✓', 'The prose shows only the badge');
  assert.ok(inline[0].querySelector('.badge.lean.verified'), 'All cited declarations pass, so the badge shows');
  // The list of pages switches pages.
  d.querySelector('#background a[data-bg-nav="literature"]').click();
  assert.deepEqual(shown(), ['literature']);
  assert.ok(d.querySelector('#bg-page-literature #paper-catalogue #papers'), 'The catalogue is mounted on the Literature page');
  // A record's page links to the item it cites, and the item lists it.
  w.openPage({type: 'result', id: 'r'});
  const cite = d.querySelector('#page button[data-open-background="later-lemma"]');
  assert.ok(cite, 'A result citing a lemma links to it');
  cite.click();
  assert.deepEqual(shown(), ['second']);
  assert.deepEqual(errors, []);
  console.log('PASS: Background pages, items, Lean links, cross-references both ways, routes and the Literature page.');
})().then(() => w.close()).catch(e => { console.error(e); w.close(); process.exit(1); });

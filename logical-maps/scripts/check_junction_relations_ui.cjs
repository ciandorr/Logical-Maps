// NODE_PATH=/path/to/node_modules node scripts/check_junction_relations_ui.cjs
// Standalone conjunctions use the whole expression for every relation and fill.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const template = fs.readFileSync(path.resolve(__dirname, '../viewer/template.html'), 'utf8');
const certificate = {source_id: 'paper', lean: 'none'};
const rule = (id, premises, conclusion, status = 'proved') => ({id, premises, conclusion, status, certificate});
const model = (id, satisfies, violates = []) => ({id, name: id, satisfies, violates, status: 'proved', certificate});
const data = {
  topic: {id: 'junction-relations', title: 'Junction relations', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['p','q','r','a','e','x','y','z','g'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [rule('pqr', ['p','q'], 'r'), rule('ap', ['a'], 'p'), rule('aq', ['a'], 'q'), rule('epqf', ['e','p','q'], 'false'),
    rule('gp', ['g'], 'p', 'conjectured'), rule('gq', ['g'], 'q', 'conjectured')],
  models: [model('positive', ['x','p','q']), model('negative', ['y','p'], ['q']),
    model('both-positive', ['z','p','q']), model('both-negative', ['z','p'], ['q']),
    model('separate-p', ['g','p']), model('separate-q', ['g','q'])]
};
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(String(e)));
const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc});
const w = dom.window, d = w.document;
const junction = () => d.querySelector('[data-graph-node="j:pqr"]');
const fill = () => w.getComputedStyle(junction().querySelector('circle')).fill.replaceAll('"','');
const title = () => junction().querySelector('title').textContent;
const select = id => w.select({type: 'principle', id});
try {
  assert.equal(junction().dataset.parent, undefined, 'The tested conjunction has no equivalent principle box');
  const normal = fill();
  for (const [id, kind, tooltip, expectedFill] of [
    ['a','entailed','Entailed by selection','var(--rel-entailed)'],
    ['e','excluded','Excluded by selection','var(--rel-excluded)'],
    ['x','consistent','Consistent with selection','url(#split-consistent)'],
    ['y','separated','Negation is consistent with selection','url(#split-separated)'],
    ['z','independent','Independent of selection','url(#split-independent)'],
    ['g','open','Open relative to selection',normal]
  ]) {
    select(id);
    assert.ok(junction().classList.contains('rel-' + kind), kind);
    assert.equal(fill(), expectedFill, kind + ' uses the corresponding box fill');
    assert.equal(title(), 'P ∧ Q\n' + tooltip);
    assert.equal(junction().querySelector('text').textContent, '∧', 'Shading keeps the conjunction symbol');
  }
  assert.equal(w.eval("selectionRelation('g','p').kind"), 'consistent');
  assert.equal(w.eval("selectionRelation('g','q').kind"), 'consistent');
  assert.equal(w.eval("selectionRelation('g',['p','q']).kind"), 'open', 'Separate positive witnesses do not establish a joint witness');
  d.getElementById('show-conj').click(); select('g');
  assert.ok(junction().classList.contains('rel-conjectured'));
  assert.equal(fill(), 'url(#hatch-conjectured)');
  d.getElementById('show-conj').click(); select('g');
  assert.equal(fill(), normal, 'Turning conjectures off restores an open conjunction');
  select('a');
  const counted = [...d.querySelectorAll('#nodes .node.rel-entailed, #nodes .junction.rel-entailed:not([data-parent])')].length;
  assert.equal(d.querySelector('#relation-legend .entailed .n').textContent, String(counted));
  w.handleGraphClick(junction());
  assert.ok(junction().classList.contains('rel-base')); assert.equal(fill(), 'var(--hl)');
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(state.focus)')), ['p','q']);
  assert.equal(title(), 'P ∧ Q\nSelected conjunction');
  select('z'); assert.equal(fill(), 'url(#split-independent)');
  w.handleGraphClick(junction(), true);
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(state.focus)')), ['z','p','q']);
  assert.ok(junction().classList.contains('rel-entailed')); assert.equal(fill(), 'var(--rel-entailed)');
  select('e'); w.select({type: 'principle', id: 'p'}, true); w.select({type: 'principle', id: 'q'}, true);
  assert.ok(junction().classList.contains('rel-excluded')); assert.equal(fill(), 'var(--rel-excluded)');
  select('x'); assert.equal(fill(), 'url(#split-consistent)', 'Removing an inconsistent selection restores relation shading');
  w.select(null); assert.equal(fill(), normal); assert.equal(title(), 'P ∧ Q');
  assert.ok(![...junction().classList].some(c => c.startsWith('rel-')));
  assert.deepEqual(errors, []);
  console.log('PASS: standalone conjunction proof/consistency/open/conjecture fills, full-premise witnesses, concise tooltips, legend counts, multiselection, inconsistency and clearing.');
} finally { w.close(); }

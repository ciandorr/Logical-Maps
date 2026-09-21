// NODE_PATH=/path/to/node_modules node scripts/check_graph_search_ui.cjs
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const data = JSON.parse(fs.readFileSync(path.join(root, 'build/unbounded-utility/data.json'), 'utf8'));
const target = 'reflection-anti-invariance';
data.principles.find(p => p.id === target).aliases = ['Mirror preference'];
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
const dom = new JSDOM(fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8').replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
  url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
});
const w = dom.window, doc = w.document, input = doc.getElementById('graph-search');
const search = q => { input.value = q; input.dispatchEvent(new w.Event('input', {bubbles: true})); };
const graphMatch = () => doc.querySelector('#graph .node.search-current');
const status = () => doc.getElementById('graph-search-status').textContent;
try {
  search('REFLECTION anti invariance');
  assert.ok(graphMatch()?.dataset.members.split(',').includes(target));
  assert.ok(doc.querySelector(`[data-pr-row="${target}"].search-current`));
  assert.equal(status(), '1 of 1');
  assert.ok(w.eval(`(() => {const n = layout.visible.find(n => n.members?.includes('${target}')); return Math.abs(layout.x.get(n.id) * view.k + view.tx - 400) < .01;})()`), 'Search centers the matching node');
  w.hover({node: 'falsity'}); w.hover(null);
  assert.ok(graphMatch(), 'Mouse hover does not erase the search highlight');
  assert.equal(doc.getElementById('pop').hidden, true, 'Search does not open a popup');
  search('mirror preference'); assert.ok(graphMatch()?.dataset.members.includes(target), 'Aliases are searchable');
  search('invariance');
  const first = doc.querySelector('.pr-row.search-current').dataset.prRow;
  assert.ok(doc.querySelectorAll('.pr-row.search-match').length > 1);
  input.dispatchEvent(new w.KeyboardEvent('keydown', {key: 'Enter', bubbles: true}));
  assert.notEqual(doc.querySelector('.pr-row.search-current').dataset.prRow, first);
  input.dispatchEvent(new w.KeyboardEvent('keydown', {key: 'Enter', shiftKey: true, bubbles: true}));
  assert.equal(doc.querySelector('.pr-row.search-current').dataset.prRow, first);
  search('no such principle'); assert.equal(status(), 'No matching principles');
  assert.equal(doc.querySelectorAll('.search-match').length, 0);
  // Search may reveal a cleared/isolated principle without changing selections.
  search(''); doc.getElementById('pr-none').click();
  for (const cb of doc.querySelectorAll('[data-source-filter]')) if (cb.checked) cb.click();
  doc.getElementById('show-iso').click();
  search('reflection'); assert.ok(graphMatch()); assert.match(status(), /Temporarily shown/);
  assert.equal(doc.querySelector(`[data-show-positive="${target}"]`).getAttribute('aria-pressed'), 'false');
  assert.equal(w.eval(`state.excluded.has('${target}')`), true);
  input.dispatchEvent(new w.KeyboardEvent('keydown', {key: 'Escape', bubbles: true}));
  assert.equal(input.value, ''); assert.equal(status(), '');
  // Only the True box remains, carrying the topic's default assumptions.
  assert.ok([...doc.querySelectorAll('#graph .node')].every(n => n.dataset.members.split(',').includes('⊤')), 'Clearing search restores hidden nodes');
  w.changeBackground(target, true); search('reflection');
  assert.match(status(), /In background/);
  assert.ok(doc.querySelector(`[data-background-id="${target}"].search-current`));
  assert.ok(w.eval(`inBackground('${target}')`), 'Searching never removes an assumption from background');
  assert.ok(!graphMatch() || graphMatch().dataset.members.split(',').includes('⊤'), 'It is found where it now sits, in the True box');
  w.changeBackground(target, false); assert.ok(graphMatch(), 'Highlights survive background and graph redraws');
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: graph search finds names, IDs and aliases, highlights both lists and graph, centers/cycles matches, and preserves filters and background.');
} finally { w.close(); }

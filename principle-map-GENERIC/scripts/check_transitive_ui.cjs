// NODE_PATH=/path/to/node_modules node scripts/check_transitive_ui.cjs
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const template = fs.readFileSync(path.join(__dirname, '../viewer/template.html'), 'utf8');
const rule = (id, premises, conclusion, status = 'proved') => ({
  id, premises, conclusion, status, certificate: {source_id: 'paper', lean: 'none'},
  sources: ['Fixture'], source_names: ['Fixture'],
});
const data = {
  topic: {id: 'transitivity', title: 'Transitivity', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['a', 'b', 'c', 'd', 'e', 't', 'x', 'y', 'z', 'q', 's'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [rule('abc', ['a', 'b'], 'c'), rule('cd', ['c'], 'd'), rule('de', ['d'], 'e'),
    rule('xy', ['x'], 'y', 'conjectured'), rule('yz', ['y'], 'z', 'conjectured'),
    rule('qsy', ['q', 's'], 'y', 'conjectured'), rule('eat', ['e', 'a'], 't')], models: [],
};
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
  url: 'https://maps.example/?assume=', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
});
const w = dom.window, doc = w.document;
const graph = () => JSON.parse(w.eval('JSON.stringify(buildGraph())'));
const node = (g, p) => g.nodes.find(n => n.members?.includes(p)).id;
const connection = (g, a, b) => g.edges.find(e => e.from === a && e.to === b);
try {
  let g = graph();
  assert.ok(connection(g, node(g, 'c'), node(g, 'e')), 'C ⇒ D ⇒ E includes C ⇒ E automatically');
  for (const target of ['d', 'e', 't']) {
    const e = connection(g, 'j:abc', node(g, target));
    assert.ok(e, 'A ∧ B has its own transitive arrow to ' + target);
    assert.deepEqual(e.premises, ['a', 'b']);
    assert.ok(e.via.includes('abc'));
    for (const p of ['a', 'b']) assert.equal(connection(g, node(g, p), node(g, target)), undefined, 'A conjunction cannot be split into singleton implications');
  }
  const downstream = connection(g, 'j:abc', node(g, 'e'));
  w.handleGraphClick(doc.querySelector(`[data-edge="${downstream.key}"] .edge`));
  assert.equal(doc.querySelector('#pop .pop-t').textContent, 'A ∧ B ⇒ E');
  assert.deepEqual([...doc.querySelectorAll('#pop [data-result]')].map(e => e.dataset.result).sort(), ['abc', 'cd', 'de']);
  w.hover({result: downstream.key});
  for (const p of ['a', 'b']) assert.ok(doc.querySelector(`[data-class="${node(g, p)}"]`).classList.contains('hot'), 'Hover shows the whole conjunction');
  doc.querySelector('[data-show-positive="d"]').click();
  g = graph(); assert.ok(connection(g, 'j:abc', node(g, 'e')), 'Hidden intermediate does not remove a consequence');
  doc.getElementById('show-conj').click();
  g = graph();
  const xz = connection(g, node(g, 'x'), node(g, 'z'));
  assert.ok(xz?.conjectured, 'A chain of conjectures stays conjectural');
  assert.deepEqual(xz.via, ['xy', 'yz']);
  const qsz = connection(g, 'j:qsy', node(g, 'z'));
  assert.ok(qsz?.conjectured, 'Conjectured conjunction also carries transitive consequences');
  for (const p of ['q', 's']) assert.equal(connection(g, node(g, p), node(g, 'z')), undefined);
  assert.equal(w.eval("E.entails(['x'], 'z')"), null, 'Displaying conjectures never makes them proof evidence');
  doc.querySelector('[data-source-filter="paper"]').click();
  doc.getElementById('show-iso').click();
  g = graph();
  assert.ok(connection(g, node(g, 'x'), node(g, 'z'))?.conjectured);
  assert.ok(w.eval('new Set(layout.visible.filter(n => n.kind === "class").map(n => layout.y.get(n.id))).size > 1'), 'Conjectures-only view arranges the flow across layers');
  assert.equal(connection(g, node(g, 'c'), node(g, 'e')), undefined, 'Disabled sources cannot supply proved transitive arrows');
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: transitive arrows are automatic, preserve conjunctions and provenance, and never promote conjectures to proofs.');
} finally { w.close(); }

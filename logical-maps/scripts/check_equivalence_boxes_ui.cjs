// NODE_PATH=/path/to/node_modules node scripts/check_equivalence_boxes_ui.cjs
// Logical constants are display classes; conjunctions use their full premise
// set for both equivalence and relation inspection. No evidence is fabricated.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..'), template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const pages = [], errors = [];
const certificate = {source_id: 'paper', lean: 'none'};
const rule = (id, premises, conclusion, status = 'proved') => ({id, premises, conclusion, status, certificate, sources: ['Fixture']});
const fixture = {
  topic: {id: 'equivalence', title: 'Equivalence', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['a', 'b', 'c', 'd', 'e', 'x', 'y', 't', 'u', 'v', 'true'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [rule('ca', ['c'], 'a'), rule('cb', ['c'], 'b'), rule('abc', ['a', 'b'], 'c'),
    rule('cd', ['c'], 'd'), rule('abef', ['a', 'b', 'e'], 'false'), rule('xf', ['x'], 'false'),
    rule('yf', ['y'], 'false'), rule('t', [], 't'), rule('u', [], 'u'), rule('abv', ['a', 'b'], 'v', 'conjectured')],
  models: [{id: 'witness', name: 'Witness', status: 'proved', satisfies: ['a', 'b'], violates: ['v'], certificate, sources: ['Fixture']}],
};
function page(data = fixture, query = '') {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {url: 'https://maps.example/' + query, runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc});
  pages.push(dom); return dom;
}
const json = (w, code) => JSON.parse(w.eval(`JSON.stringify(${code})`));
try {
  const {window: w} = page(), d = w.document;
  const node = id => [...d.querySelectorAll('#nodes .node')].find(n => n.dataset.members.split(',').includes(id));
  assert.equal(node('x'), node('y')); assert.ok(node('x').classList.contains('falsity'));
  assert.equal(node('t'), node('u')); assert.ok(node('t').classList.contains('from-background'));
  assert.match(node('x').textContent, /False/); assert.match(node('t').textContent, /True/);
  assert.ok(node('true').querySelector('[data-principle="true"]'), 'The display constant does not reserve an existing principle ID');
  assert.equal(d.querySelectorAll('.edge.trivial').length, 0);
  const parent = w.eval("layout.byId.get('j:abc').parent");
  assert.equal(parent, node('c').dataset.class);
  assert.ok(!w.eval("layout.edges.some(e => e.from === 'j:abc' && e.to === layout.byId.get('j:abc').parent)"), 'Equivalence has no internal implication arrow');
  for (const id of ['j:abc', 'j:abef']) {
    assert.ok(w.eval(`(()=>{const j=layout.byId.get('${id}'),s=layout.size.get(j.parent),x=layout.x.get(j.parent),y=layout.y.get(j.parent);return Math.abs(layout.x.get(j.id)-x)+11<s.w/2&&Math.abs(layout.y.get(j.id)-y)+11<s.h/2})()`), 'Conjunction circle is wholly inside the equivalent box');
    assert.ok(w.eval(`layout.edges.filter(e=>e.to==='${id}').every(e=>{const j=layout.byId.get(e.to);return Math.abs(e.geometry.points[3].x-layout.x.get(j.id))<=11.01&&Math.abs(e.geometry.points[3].y-layout.y.get(j.id))<=11.01})`), 'Premise strokes terminate on the enclosed circle');
  }
  w.handleGraphClick(d.querySelector('[data-graph-node="j:abc"]'));
  assert.deepEqual(json(w, 'state.focus'), ['a', 'b']);
  assert.ok(node('c').classList.contains('rel-entailed')); assert.ok(node('d').classList.contains('rel-entailed'));
  assert.ok(node('e').classList.contains('rel-excluded')); assert.ok(node('v').classList.contains('rel-separated'));
  assert.match(d.getElementById('relation-legend').textContent, /Relative to A ∧ B/);
  assert.match(d.getElementById('pop').textContent, /Equivalence/);
  assert.ok(d.querySelector('#pop [data-result="abc"]')); assert.ok(d.querySelector('#pop [data-result="ca"]'));
  d.querySelector('#pop [data-graph-connection="abc"]').click();
  assert.equal(w.eval('state.selected.type'), 'result'); assert.deepEqual(json(w, 'state.focus'), ['a', 'b']);
  w.armCompare(); w.handleGraphClick(node('v').querySelector('text[data-principle]'));
  assert.equal(w.eval('state.selected.type'), 'compare');
  assert.match(d.getElementById('pop').textContent, /A ∧ B ⇒ V[\s\S]*refuted by a model/);
  assert.ok(d.querySelector('#pop [data-model="witness"]'));
  w.handleGraphClick(d.querySelector('[data-graph-node="j:abef"]'));
  assert.ok(d.getElementById('graph').classList.contains('inconsistent-selection'));
  for (const n of d.querySelectorAll('#nodes .node')) assert.ok(n.classList.contains('rel-excluded'), 'Impossible conjunctions mark every box, including True and False, as excluded');
  assert.equal(w.eval("expressionStatus(['a','b','e'],'d').status"), 'inconsistent', 'The proof engine still identifies the inconsistent antecedent');
  assert.match(d.getElementById('relation-legend').textContent, /inconsistent/);
  // Labels inside constant boxes still inspect the individual principle.
  w.handleGraphClick(node('y').querySelector('[data-principle="y"]'));
  assert.equal(w.eval('state.selected.id'), 'y'); assert.ok(d.querySelector('#pop [data-result="yf"]'));
  const before = json(w, "[E.entails(['x'],'a'),E.pair('x','a'),[...background]]");
  d.getElementById('trivial-arrows').click();
  const roots = json(w, "layout.visible.filter(n=>!n.parent&&n.id!=='falsity'&&n.id!=='truth').map(n=>n.id)");
  for (const id of roots) {
    assert.ok(w.eval(`layout.edges.some(e=>e.trivial&&e.from==='falsity'&&e.to==='${id}')`));
    assert.ok(w.eval(`layout.edges.some(e=>e.trivial&&e.from==='${id}'&&e.to==='truth')`));
  }
  assert.ok(w.eval("layout.edges.filter(e=>e.trivial).every(e=>layout.y.get(e.from)>layout.y.get(e.to))"));
  w.handleGraphClick(d.querySelector('.edge.trivial'));
  assert.equal(w.eval('state.selected.type'), 'trivial'); assert.match(d.getElementById('pop').textContent, /explosion/);
  assert.deepEqual(json(w, "[E.entails(['x'],'a'),E.pair('x','a'),[...background]]"), before, 'Trivial arrows do not change evidence');
  d.getElementById('trivial-arrows').click(); assert.equal(d.querySelectorAll('.edge.trivial').length, 0);
  // A conjectural reverse direction must never create an equivalence box.
  const conjecture = page({...fixture, results: fixture.results.map(r => r.id === 'abc' ? {...r, status: 'conjectured'} : r)}).window;
  conjecture.document.getElementById('show-conj').click();
  assert.ok(!conjecture.eval("layout.byId.get('j:abc').parent"));
  // The exact background from Cian's example.
  const data = JSON.parse(fs.readFileSync(path.join(root, 'build/unbounded-utility/data.json'), 'utf8'));
  const real = page(data, '?assume=archimedean-outcomes,expected-utility,independence,rich-outcomes,simple-eu,statewise-dominance,stochastic-dominance,stochastic-equivalence,totality').window;
  assert.ok(real.eval("layout.visible.some(j=>j.kind==='junction'&&j.premises.includes('shift-invariance')&&j.premises.includes('scale-invariance')&&layout.byId.get(j.parent)?.members.includes('positive-affine-invariance'))"), 'Positive Affine Invariance encloses Shift ∧ Scale');
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: False/True equivalence boxes, trivial arrows, unchanged evidence, enclosed meets and proof links, conjunction relation shading/comparison, and Cian’s exact example.');
} finally { pages.forEach(p => p.window.close()); }

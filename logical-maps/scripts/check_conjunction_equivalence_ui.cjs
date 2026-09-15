// NODE_PATH=/path/to/node_modules node scripts/check_conjunction_equivalence_ui.cjs
// Conjunction-only equivalence classes preserve separate premise endpoints,
// proved equivalence evidence, selection, and full-conjunction relation shading.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..'), template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const pages = [], errors = [];
const certificate = {source_id: 'paper', lean: 'none'};
const rule = (id, premises, conclusion) => ({id, premises, conclusion, status: 'proved', certificate, sources: ['Fixture']});
const model = (id, satisfies, violates) => ({id, name: id, satisfies, violates, status: 'proved', certificate, sources: ['Fixture']});
const fixture = {
  topic: {id: 'conjunctions', title: 'Conjunctions', background: [], source_catalog: [
    {id: 'paper', name: 'Paper', kind: 'published-paper'}, {id: 'reverse', name: 'Reverse', kind: 'misc'}]},
  principles: ['p', 'q', 'r', 's', 't', 'u', 'v', 'out', 'x', 'z'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [rule('pqr', ['p', 'q'], 'r'), {...rule('prq', ['p', 'r'], 'q'), certificate: {source_id: 'reverse'}},
    rule('prs', ['p', 'r'], 's'), rule('psr', ['p', 's'], 'r'), rule('ptr', ['p', 't'], 'r'),
    rule('pqout', ['p', 'q'], 'out'), rule('uvout', ['u', 'v'], 'out'), rule('pqxf', ['p', 'q', 'x'], 'false')],
  models: [model('p-only', ['z', 'p'], ['q', 'r', 's']), model('q-only', ['z', 'q'], ['p'])],
};
function page(data = fixture) {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc});
  pages.push(dom); return dom.window;
}
const json = (w, code) => JSON.parse(w.eval(`JSON.stringify(${code})`) ?? 'null');
const junction = (w, premises) => json(w, `layout.visible.find(n=>n.kind==='junction'&&sameExpression(n.premises,${JSON.stringify(premises)}))`);
const box = (w, j) => w.document.querySelector(`[data-class="${j.parent}"]`);
const circle = (w, j) => w.document.querySelector(`[data-graph-node="${j.id}"]`);
function checkGeometry(w, j) {
  const data = json(w, `(()=>{const j=layout.byId.get(${JSON.stringify(j.id)}), b=layout.byId.get(j.parent), bounds=n=>({x:layout.x.get(n.id),y:layout.y.get(n.id),...layout.size.get(n.id)});return {j:bounds(j),b:bounds(b),inputs:layout.edges.filter(e=>e.to===j.id&&e.toJunction).map(e=>({id:e.from,end:e.geometry.points[3],y:layout.y.get(e.from)})),outputs:layout.edges.filter(e=>e.from===j.id).map(e=>({y:layout.y.get(e.to),parent:layout.byId.get(e.to).parent}))}})()`);
  assert.ok(Math.abs(data.j.x-data.b.x)+11<data.b.w/2 && Math.abs(data.j.y-data.b.y)+11<data.b.h/2, 'Circle lies inside its shared box');
  assert.equal(data.inputs.length, 2, 'Each conjunction retains its two premise strokes');
  for (const e of data.inputs) {
    assert.ok(e.y<data.j.y, 'Premise strokes descend');
    assert.ok(Math.abs(e.end.x-data.j.x)<=11.01 && Math.abs(e.end.y-data.j.y)<=11.01, 'Premise strokes end at the distinct circle');
  }
  for (const e of data.outputs) assert.ok(e.y<data.j.y, 'Implications ascend from the enclosed conjunction');
}
try {
  const w = page(), d = w.document;
  const pq = junction(w, ['p','q']), pr = junction(w, ['p','r']), ps = junction(w, ['p','s']);
  assert.ok(pq.parent); assert.equal(pq.parent, pr.parent); assert.equal(pq.parent, ps.parent);
  assert.equal(w.eval(`layout.byId.get('${pq.parent}').kind`), 'equivalence');
  assert.ok(!junction(w, ['p','t']).parent, 'One-way implication does not establish equivalence');
  assert.ok(!junction(w, ['u','v']).parent, 'Sharing a consequence does not establish equivalence');
  assert.equal(box(w, pq).querySelector('.equiv').textContent, 'equivalent');
  assert.ok(!box(w, pq).classList.contains('from-background'), 'An empty principle list does not make a conjunction class True');
  assert.ok(!box(w, pq).classList.contains('iso'), 'Enclosed conjunction edges make the box connected');
  assert.match(box(w, pq).textContent, /P ∧ Q ≡ P ∧ R ≡ P ∧ S/);
  for (const j of [pq, pr, ps]) {
    checkGeometry(w, j);
    w.handleGraphClick(circle(w, j));
    assert.deepEqual(json(w, 'state.focus'), j.premises);
    assert.ok(circle(w, j).classList.contains('selected'));
    assert.ok(box(w, j).classList.contains('rel-base'));
    assert.ok(d.querySelector('#pop [data-result="pqr"]'));
    assert.ok(d.querySelector('#pop [data-result="prq"]'), 'Both equivalence proof directions are accessible');
    d.querySelector('#pop [data-result="prq"]').click();
    assert.equal(w.eval('state.selected.id'), 'prq');
    assert.deepEqual(json(w, 'state.focus'), j.premises, 'Reading equivalence evidence preserves the selection');
  }
  w.handleGraphClick(box(w, pq).querySelector('rect'));
  assert.deepEqual(json(w, 'state.focus'), pq.premises, 'Clicking the box selects a real conjunction');
  w.handleGraphClick(circle(w, ps), true);
  assert.deepEqual(json(w, 'state.focus'), ['p','q','s'], 'Modifier-click adds the full premise set without simplifying it');
  w.handleGraphClick(circle(w, ps), true);
  assert.equal(w.eval('state.focus'), 'q', 'Modifier-click removes a conjunction whose premises are already selected');
  w.select({type:'principle', id:'z'});
  assert.ok(box(w, pq).classList.contains('rel-separated'), 'Separate models of conjuncts cannot witness their conjunction');
  w.select({type:'principle', id:'x'});
  assert.ok(box(w, pq).classList.contains('rel-excluded'), 'Joint incompatibility excludes the whole conjunction');
  d.getElementById('trivial-arrows').click();
  assert.ok(w.eval(`layout.edges.some(e=>e.trivial&&e.from==='${pq.parent}'&&e.to==='truth')`));
  assert.ok(w.eval(`layout.edges.some(e=>e.trivial&&e.to==='${pq.parent}'&&e.from==='falsity')`));
  assert.ok(w.eval("layout.edges.filter(e=>e.trivial).every(e=>!e.display.includes('undefined'))"));
  w.eval("state.allowed.delete('reverse');recompute();renderAll(true)");
  assert.ok(!junction(w, ['p','q']).parent, 'Removing the reverse proof splits the class');
  w.eval("state.allowed.add('reverse');recompute();renderAll(true)");
  assert.equal(junction(w, ['p','q']).parent, junction(w, ['p','r']).parent, 'Restoring evidence restores the class');
  const conjecture = page({...fixture, results: fixture.results.map(r=>r.id==='prq'?{...r,status:'conjectured'}:r)});
  conjecture.document.getElementById('show-conj').click();
  assert.ok(!junction(conjecture, ['p','q']).parent, 'A conjectural reverse does not merge conjunctions');
  const independent = page({...fixture, models: [...fixture.models, model('joint', ['z','p','q'], ['x'])]});
  independent.select({type:'principle',id:'z'});
  assert.ok(box(independent,junction(independent,['p','q'])).classList.contains('rel-independent'), 'A joint positive witness and a failed conjunct witness independence');
  const real = page(JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8')));
  real.addBackgroundPreset('dtu');
  const affine = 'negative-affine-anti-invariance';
  const relative = junction(real,[affine,'relative-expectation']), continuity = junction(real,[affine,'l1-continuity']);
  assert.ok(relative.parent); assert.equal(relative.parent,continuity.parent, 'DTU: Affine Negative + Relative Ex = Affine Negative + L1 Cont');
  for (const j of [relative,continuity]) {
    checkGeometry(real,j); real.handleGraphClick(circle(real,j));
    assert.ok(real.document.querySelector('#pop [data-result="symmetry-relative-implies-l1"]'));
    assert.ok(real.document.querySelector('#pop [data-result="du-l1-implies-relative"]'));
  }
  real.eval('background.clear();recompute();renderAll(true)');
  assert.ok(!junction(real,[affine,'l1-continuity'])?.parent, 'DTU-specific equivalence disappears without its background');
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: conjunction-only equivalence boxes, distinct premise endpoints, proof links, selection/shading, source/background changes, conjecture discipline, and the DTU example.');
} finally { pages.forEach(p=>p.window.close()); }

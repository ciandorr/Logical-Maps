// NODE_PATH=/path/to/node_modules node scripts/check_graph_resolutions_ui.cjs
// Resolved historical questions must not re-enter graph arrows or deductions.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..'), template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const pages = [], errors = [], certificate = {source_id: 'paper', lean: 'none'};
const rule = (id, premises, conclusion, status = 'conjectured') => ({id, premises, conclusion, status, certificate});
const data = {
  topic: {id: 'resolutions', title: 'Resolutions', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}, {id: 'witness', name: 'Witness', kind: 'misc'}]},
  principles: ['a','b','c','d','e','k','t'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [rule('refuted', ['a'], 'b'), rule('resolved', ['a'], 'c'), rule('proof', ['a'], 'c', 'proved'),
    rule('conditional', ['t','a'], 'b', 'proved'), rule('open', ['d'], 'e'), rule('downstream', ['b'], 'd')],
  models: [{id: 'counterexample', name: 'Counterexample', satisfies: ['a'], violates: ['b'], status: 'proved', certificate: {source_id: 'witness', lean: 'none'}}]
};
function page(data) {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(String(e)));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc});
  pages.push(dom); return dom.window;
}
const absent = (w, id) => assert.ok(w.eval(`!buildGraph().edges.some(e=>e.r?.id===${JSON.stringify(id)}||e.via?.includes(${JSON.stringify(id)}))`), id + ' supplies neither arrows nor derived paths');
try {
  const w = page(data), d = w.document;
  d.getElementById('show-conj').click();
  for (const id of ['refuted','resolved']) absent(w,id);
  assert.ok(w.eval("buildGraph().edges.some(e=>e.r?.id==='open')"));
  d.querySelector('[data-source-filter="witness"]').click();
  absent(w,'refuted');
  assert.equal(w.eval("pairStatus('a','b').status"), 'open', 'The conjectural query engine also excludes the refuted rule');
  assert.equal(w.eval("EC.entails(['a'],'d')"), null, 'No downstream deduction can use a refuted rule');
  d.querySelector('[data-source-filter="paper"]').click();
  absent(w,'refuted'); absent(w,'resolved');
  d.getElementById('conjecture-only').click();
  absent(w,'refuted'); absent(w,'resolved');
  d.querySelector('[data-source-filter="paper"]').click();
  d.querySelector('[data-source-filter="witness"]').click();
  w.changeBackground('k',true);
  assert.equal(w.eval("allEvidenceE.resolveConjecture(byRid.get('refuted')).status"), 'open');
  assert.ok(w.eval("buildGraph().edges.some(e=>e.r?.id==='refuted')"), 'A changed background can make the question genuinely open');
  w.changeBackground('t',true);
  assert.equal(w.eval("allEvidenceE.resolveConjecture(byRid.get('refuted')).status"), 'proved'); absent(w,'refuted');
  w.changeBackground('k',false); w.changeBackground('t',false);
  d.querySelector('[data-tab="open"]').click();
  assert.ok(d.getElementById('open-recorded'),'The Conjectures tab keeps its recorded-conjectures section');
  assert.equal(w.eval("byRid.get('refuted').status"),'conjectured','Resolution preserves question history');
  const real = page(JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8')));
  const shift = 'conjectured-dtu-shift-implies-transfer';
  real.addBackgroundPreset('dtu'); real.document.getElementById('show-conj').click();
  assert.equal(real.eval(`allEvidenceE.resolveConjecture(byRid.get('${shift}')).status`),'refuted'); absent(real,shift);
  assert.ok(real.eval(`allEvidenceE.resolveConjecture(byRid.get('${shift}')).models.includes('finite-shift-total-extension')`));
  real.document.querySelector('[data-source-filter="misc"]').click(); absent(real,shift);
  real.document.getElementById('conjecture-only').click(); absent(real,shift);
  real.document.getElementById('unpublished-only').click(); absent(real,shift);
  real.changeBackground('l1-continuity',true);
  assert.equal(real.eval(`allEvidenceE.resolveConjecture(byRid.get('${shift}')).status`),'proved'); absent(real,shift);
  assert.equal(real.eval(`byRid.get('${shift}').status`),'conjectured');
  assert.deepEqual(errors, []);
  console.log('PASS: resolved graph questions stay out of arrows and deductions, source filters cannot reopen them, changed backgrounds are recomputed, history remains accessible, and DTU Shift Invariance → Shift Transfer is refuted.');
} finally { pages.forEach(p=>p.window.close()); }

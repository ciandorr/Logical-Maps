// NODE_PATH=/path/to/node_modules node scripts/check_signed_ui.cjs (requires jsdom).
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const errors = [], pages = [];
const certificate = {source_id: 'paper', lean: 'none', produced_by: 'Fixture author', checked_by: []};
const rule = (id, premises, conclusion, status = 'proved') => ({id, premises, conclusion, status, certificate, sources: ['Fixture proof']});
const model = (id, satisfies, violates) => ({id, name: id, satisfies, violates, status: 'proved', certificate, sources: ['Fixture model']});
const data = {
  topic: {id: 'signed', title: 'Signed assumptions', background: [], source_catalog: [{id: 'paper', name: 'A paper', kind: 'published-paper'}]},
  principles: [...'abcde'].map(id => ({id, name: id.toUpperCase(), statement: `Principle ${id}`})),
  results: [rule('ab-c', ['a','b'], 'c'), rule('c-d', ['c'], 'd'), rule('ae-false', ['a','e'], 'false'), rule('guess', ['e'], 'c', 'conjectured')],
  models: [model('positive', ['a','b'], ['e']), model('negative', ['a'], ['c']), model('unknown', [], [])],
};
function page(url = 'https://maps.example/?assume=', reduced = false) {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {url, runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
    beforeParse(w) { w.matchMedia = () => ({matches: reduced, addEventListener() {}}); },
  });
  pages.push(dom); return dom;
}
const dom = page(), w = dom.window, doc = w.document;
const evaluate = code => JSON.parse(w.eval(`JSON.stringify(${code})`));
const click = selector => { const el = doc.querySelector(selector); assert.ok(el, selector); el.click(); };
try {
  // Displaying both forms is compatible; adding both defaults to positive.
  click('[data-show-negative="b"]');
  assert.equal(doc.querySelector('[data-show-positive="b"]').getAttribute('aria-pressed'), 'true');
  click('[data-add-background="b"]');
  assert.deepEqual(evaluate('[[...background],[...negativeBackground]]'), [['b'], []]);
  click('#background-list [data-assume-negative="b"]');
  assert.deepEqual(evaluate('[[...background],[...negativeBackground]]'), [[], ['b']]);
  assert.equal(doc.querySelector('#background-list [data-assume-positive="b"]').getAttribute('aria-pressed'), 'false');
  click('#background-list [data-remove-background="b"]');
  assert.ok(doc.querySelector('#graph [data-members="!b"]'));
  assert.equal(doc.querySelector('[data-show-positive="b"]').getAttribute('aria-pressed'), 'false');
  click('[data-add-background="b"]');
  assert.deepEqual(evaluate('[[...background],[...negativeBackground]]'), [[], ['b']], 'Only cross selected must move as negative');
  const reload = page(w.location.href);
  assert.equal(reload.window.eval("negativeBackground.has('b')"), true);
  click('#background-reset');
  for (const form of ['positive', 'negative']) if (doc.querySelector(`[data-show-${form}="c"]`).getAttribute('aria-pressed') === 'true') click(`[data-show-${form}="c"]`);
  click('[data-add-background="c"]');
  assert.equal(w.eval("background.has('c')"), true, 'Neither form selected defaults to positive');
  click('#background-reset');

  // Explorer choices are the same background, with no duplicate assumption dock.
  click('[data-tab="models"]');
  assert.equal(doc.querySelector('.explorer-toolbar'), null);
  assert.equal(doc.querySelector('#models [data-clear-assumption]'), null);
  assert.equal(doc.querySelector('#models .model-meta'), null);
  assert.match(doc.querySelector('.explorer-models').textContent, /Potential models/);
  for (const sign of ['positive', 'negative']) {
    click(`#models [data-assume-${sign}="a"]`);
    assert.equal(w.eval("inBackground('a')"), true);
    click(`#models [data-assume-${sign}="a"]`);
    assert.equal(w.eval("inBackground('a')"), false, 'Click selected sign again to clear');
  }
  click('#models [data-assume-negative="c"]');
  assert.equal(w.eval("negativeBackground.has('c')"), true);
  assert.equal(doc.querySelector('#models-background-dock'), null);
  assert.ok(doc.querySelector('#models [data-model="negative"]'));
  assert.equal(doc.querySelector('#models [data-model="positive"]'), null);
  const unknown = doc.querySelector('#models [data-model="unknown"]').closest('.ex-m');
  unknown.querySelector('[data-model]').click();
  assert.match(doc.getElementById('pop').textContent, /Unknown assumptions: ¬C/);
  click('#models [data-assume-positive="a"]');
  assert.equal(w.eval("backgroundExcluded.has('b')"), true);
  assert.equal(doc.querySelector('#models [data-assume-negative="b"]').getAttribute('aria-pressed'), 'false', 'Derived is not explicitly assumed');
  click('#models [data-assume-positive="b"]');
  assert.equal(doc.getElementById('graph-warning').hidden, false);
  assert.match(doc.querySelector('#models .ex-bad').textContent, /inconsistent/);
  assert.equal(doc.querySelectorAll('#graph .edge').length, 0);
  click('#models [data-assume-positive="b"]');
  assert.equal(doc.getElementById('graph-warning').hidden, true);
  click('[data-source-filter="paper"]');
  assert.equal(w.eval("backgroundExcluded.has('b')"), false);
  click('[data-source-filter="paper"]');
  click('#ex-clear');

  // Show all literals; retain the entire premise conjunction in contrapositives.
  w.eval('state.excluded.clear(); state.negativeShown = new Set(ids); renderAll(true)');
  const graph = evaluate('buildGraph()');
  const variants = [...new Map(graph.edges.filter(e => e.r).map(e => [e.key,e])).values()];
  assert.ok(variants.some(e => e.key === 'ab-c:not:b' && e.premises.includes('a') && e.premises.includes('!c') && e.conclusion === '!b'));
  assert.ok(!variants.some(e => e.premises.length === 1 && e.premises[0] === '!c' && e.conclusion === '!b'));
  w.eval("handleGraphClick(document.querySelector('#graph [data-members=\"!c\"] text'))");
  assert.match(doc.getElementById('pop').textContent, /¬C.*Negation of/);
  click('#pop [data-goto]');
  assert.equal(doc.querySelector('#page h1').textContent, '¬C');
  w.eval("handleGraphClick(document.querySelector('#graph [data-edge=\"ab-c:not:b\"] .edge-hit'))");
  assert.match(doc.getElementById('pop').textContent, /A ∧ ¬C ⇒ ¬B/);
  assert.match(doc.getElementById('pop').textContent, /Original result/);

  // Independent truth-table oracle for every generated signed edge and pair,
  // across all consistent/inconsistent assignments to three background variables.
  const ids = [...'abcde'];
  const valuations = Array.from({length: 32}, (_,mask) => new Set(ids.filter((_,i) => mask & (1<<i))))
    .filter(v => data.results.filter(r => r.status === 'proved').every(r => !r.premises.every(p => v.has(p)) || v.has(r.conclusion)));
  const truth = (v, literal) => literal.startsWith('!') ? !v.has(literal.slice(1)) : v.has(literal);
  for (let assignment = 0; assignment < 27; assignment++) {
    let n = assignment; const positive = [], negative = [];
    for (const id of 'abc') { const sign = n % 3; n = Math.floor(n/3); if (sign === 1) positive.push(id); if (sign === 2) negative.push(id); }
    w.eval(`background.clear(); negativeBackground.clear(); ${JSON.stringify(positive)}.forEach(p=>background.add(p)); ${JSON.stringify(negative)}.forEach(p=>negativeBackground.add(p)); recompute(); renderGraph();`);
    const valid = valuations.filter(v => positive.every(p=>v.has(p)) && negative.every(p=>!v.has(p)));
    assert.equal(w.eval('backgroundConflicts.length > 0'), !valid.length);
    if (!valid.length) continue;
    const result = evaluate('({edges:buildGraph().edges, pairs:ids.flatMap(p=>[p,"!"+p]).flatMap(a=>ids.flatMap(p=>[p,"!"+p]).map(b=>[a,b,literalPair(a,b).status]))})');
    for (const e of result.edges) if (e.r) assert.ok(valid.every(v => !e.premises.every(p=>truth(v,p)) || truth(v,e.conclusion)), `Unsound edge ${e.display}`);
    for (const [a,b,status] of result.pairs) {
      const cases = valid.filter(v=>truth(v,a));
      assert.equal(status, !cases.length ? 'inconsistent' : cases.every(v=>truth(v,b)) ? 'implies' : 'open', `${a}⇒${b}`);
    }
  }
  w.eval('background.clear(); negativeBackground.clear(); renderAll(true)');
  const geometries = evaluate('layout.edges.map(e=>({geometry:e.geometry,to:layout.size.get(e.to),center:{x:layout.x.get(e.to),y:layout.y.get(e.to)},kind:layout.byId.get(e.to).kind}))');
  for (const {geometry:g,to,center,kind} of geometries) {
    assert.ok(g.length > 0 && Number.isFinite(g.angle));
    const end=g.points[3], vx=Math.abs(end.x-center.x), vy=Math.abs(end.y-center.y);
    assert.ok(kind === 'junction' ? Math.abs(Math.hypot(vx,vy)-11)<1e-6 : Math.abs(vx-to.w/2)<1e-6 || Math.abs(vy-to.h/2)<1e-6, 'Endpoint lies on target boundary');
  }
  assert.ok(geometries.some(({geometry:g})=>Math.abs(g.points[2].x-g.points[3].x)>1), 'Arrowheads have non-vertical approach tangents');
  w.eval("state.tab='graph'; document.querySelectorAll('.edge-g').forEach(e=>e.classList.add('hot')); animateFlow()");
  assert.ok(doc.querySelectorAll('#flow animateMotion').length > 0);
  assert.ok(doc.querySelectorAll('#flow animateMotion').length <= 48);
  click('[data-tab="models"]');
  assert.equal(doc.querySelectorAll('#flow animateMotion').length, 0);
  const reduced = page(undefined, true);
  reduced.window.eval("hover({result: 'ab-c'})");
  assert.equal(reduced.window.document.querySelectorAll('#flow animateMotion').length, 0);
  assert.ok(reduced.window.document.querySelectorAll('.direction-chevron').length > 0, 'Reduced motion retains static directions');
  assert.deepEqual(errors, []);
  console.log('PASS: shared signed controls, default move polarity, exclusivity, URL restore, unknown models, source filters, contextual contraposition, 27 truth-table backgrounds, and arrow geometry.');
} finally { pages.forEach(p=>p.window.close()); }

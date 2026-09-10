// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// Rebuild unbounded-utility first: the final checks use its current data.json.
const fs = require('node:fs');
const path = require('node:path');
const assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const pages = [], errors = [];

function page(data, url = 'http://localhost/?assume=') {
  const console = new VirtualConsole();
  console.on('jsdomError', error => errors.push(error));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
    url, runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: console,
  });
  pages.push(dom);
  return dom;
}
function textOf(dom, html) {
  const element = dom.window.document.createElement('div');
  element.innerHTML = html;
  return element.textContent;
}
function stmt(dom, kind, value, abbreviated = true) {
  return textOf(dom, dom.window.eval(`${kind}Stmt(${JSON.stringify(value)},${abbreviated})`));
}
function named(dom, ids) {
  return JSON.parse(dom.window.eval(`JSON.stringify(abbreviateConjunction(${JSON.stringify(ids)}))`));
}
function select(dom, type, id) {
  dom.window.eval(`select(${JSON.stringify({type, id})})`);
  return dom.window.document.getElementById('pop');
}
const certificate = source_id => ({source_id, lean: 'none', produced_by: 'Fixture author', checked_by: []});
const rule = (id, premises, conclusion, status = 'proved', source = 'paper') => ({
  id, premises, conclusion, status, certificate: certificate(source),
  sources: ['Fixture theorem'], source_names: ['Fixture source'],
});
const model = (id, satisfies, violates) => ({
  id, name: `Model ${id}`, satisfies, violates, status: 'proved',
  certificate: certificate('paper'), sources: ['Fixture construction'], source_names: ['Fixture source'],
});
const fixture = {
  topic: {
    id: 'conjunction-fixture', title: 'Named conjunction fixture', background: [],
    source_catalog: [
      {id: 'paper', name: 'A paper', kind: 'published-paper'},
      {id: 'bridge', name: 'A bridge proof', kind: 'online-submission'},
    ],
    background_presets: [
      {id: 'du', name: 'DU', principles: ['a', 'b', 'h']},
      {id: 'dtu', name: 'DTU', principles: ['a', 'b', 'h', 't']},
      {id: 'impossible', name: 'Impossible', principles: ['a', 'b', 'x']},
    ],
  },
  principles: ['a', 'b', 'h', 't', 's', 'x', 'z'].map(id => ({id, name: id.toUpperCase(), statement: `Principle ${id}`})),
  results: [
    rule('derive-h', ['a'], 'h', 'proved', 'bridge'),
    rule('strong-a', ['s'], 'a'), rule('strong-b', ['s'], 'b'),
    rule('full-result', ['a', 'b', 'h', 't'], 'z'),
    rule('false-result', ['a', 'b', 'x'], false),
    rule('conjectured-totality', ['a', 'b'], 't', 'conjectured'),
  ],
  models: [model('du-model', ['a', 'b'], ['t', 'x']), model('dtu-model', ['a', 'b', 't'], ['x'])],
};

try {
  const dom = page(fixture), doc = dom.window.document;
  assert.match(doc.querySelector('[data-tab="models"]').textContent, /^Theory explorer\s/);
  // A proved consequence can complete a named package; the largest fitting
  // package wins, while extra hypotheses retain their own stronger content.
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b'], conclusion: 'z'}), 'DU ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b', 't'], conclusion: 'z'}), 'DTU ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b', 'h', 's'], conclusion: 'z'}), 'DU ∧ S ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: ['s'], conclusion: 'z'}), 'S ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: [], conclusion: 'z'}), '⊤ ⇒ Z');
  assert.equal(stmt(dom, 'model', {satisfies: [], violates: []}), '⊤');

  // Check both directions of each display replacement using the proved Horn
  // closure, rather than merely checking that a short label appears.
  for (const ids of [['a', 'b'], ['a', 'b', 't'], ['s', 'a', 'b'], ['a', 'b', 'h', 'x']]) {
    const short = named(dom, ids);
    const expanded = [...short.presets.flatMap(p => p.principles), ...short.remaining];
    const closure = seed => JSON.parse(dom.window.eval(`JSON.stringify([...baseE.cl(${JSON.stringify(seed)}).facts].sort())`));
    assert.deepEqual(closure(expanded), closure(ids));
    assert.ok(short.remaining.includes('s') || !ids.includes('s'), 'The stronger standalone assumption must remain visible.');
  }

  // Negative model flags never supply a package's positive assumptions and
  // never disappear into its abbreviation.
  assert.equal(stmt(dom, 'model', fixture.models[0]), 'DU ∧ ¬T ∧ ¬X');
  assert.equal(stmt(dom, 'model', fixture.models[1]), 'DTU ∧ ¬X');
  assert.equal(stmt(dom, 'model', {satisfies: ['a'], violates: ['b', 't']}), 'A ∧ ¬B ∧ ¬T');

  // An inconsistent antecedent can still display its real DU subpackage.
  // It must not manufacture Totality or use the inconsistent named preset.
  const falseResult = fixture.results.find(r => r.id === 'false-result');
  assert.equal(stmt(dom, 'result', {...falseResult, conclusion: 'false'}), 'DU ∧ X ⇒ False (⊥)');
  assert.deepEqual(named(dom, falseResult.premises).presets.map(p => p.id), ['du']);

  // Selected assumptions and visible conjectures are not proof resources for
  // an abbreviation of a record's original conjunction.
  dom.window.eval("changeBackground('b',true); changeBackground('t',true)");
  doc.getElementById('show-conj').click();
  assert.equal(stmt(dom, 'result', {premises: ['a'], conclusion: 'z'}), 'A ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b'], conclusion: 'z'}), 'DU ⇒ Z');
  dom.window.eval("changeBackground('h',true)");
  doc.querySelector('[data-source-filter="bridge"]').click();
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b'], conclusion: 'z'}), 'A ∧ B ⇒ Z');
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b', 'h'], conclusion: 'z'}), 'DU ⇒ Z');
  doc.querySelector('[data-source-filter="bridge"]').click();
  assert.equal(stmt(dom, 'result', {premises: ['a', 'b'], conclusion: 'z'}), 'DU ⇒ Z');

  // A popup is concise by default, with native, initially closed disclosure
  // preserving exactly the recorded names. Its write-up keeps exact premises.
  let pop = select(dom, 'result', 'full-result');
  assert.equal(pop.querySelector('.pop-t').textContent, 'DTU ⇒ Z');
  let details = pop.querySelector('details.full-conjunction');
  assert.ok(details);
  assert.equal(details.open, false);
  assert.equal(details.querySelector('summary').textContent, 'Show full conjunction');
  assert.deepEqual([...details.querySelectorAll('.full-conjunction-statement')].map(p => p.textContent), [
    'Recorded conjunction: A ∧ B ∧ H ∧ T ⇒ Z', 'DTU = A ∧ B ∧ H ∧ T',
  ]);
  details.querySelector('summary').click();
  assert.equal(details.open, true);
  assert.equal(doc.querySelectorAll('#pop .pop-t').length, 1);
  pop.querySelector('[data-goto]').click();
  const premiseIds = [...doc.querySelector('#page ul.plist').querySelectorAll('[data-principle]')].map(p => p.dataset.principle);
  assert.deepEqual(premiseIds, ['a', 'b', 'h', 't']);
  pop = select(dom, 'model', 'du-model');
  // The explorer already displays model verdicts. Its info popup and model
  // page omit the redundant package, while preserving sources and navigation.
  assert.equal(pop.querySelector('.pop-t').textContent, 'Model du-model');
  assert.equal(pop.querySelector('.pop-s'), null);
  assert.equal(pop.querySelector('details.full-conjunction'), null);
  assert.match(pop.textContent, /Fixture source/);
  assert.ok(pop.querySelector('.badges'));
  pop.querySelector('[data-goto]').click();
  assert.equal(doc.querySelector('#page h1').textContent, 'Model du-model');
  assert.equal(doc.querySelector('#page .full-conjunction-statement'), null);
  assert.ok(![...doc.querySelectorAll('#page h2')].some(h => h.textContent === 'Package'));
  assert.ok(doc.querySelector('#page [data-verdict="t"]'));
  assert.equal(stmt(dom, 'model', fixture.models[0], false), 'A ∧ B ∧ ¬T ∧ ¬X');

  // Topics with no packages retain the old conjunction display. Fixed topic
  // background, unlike removable viewer assumptions, may supply an axiom.
  const plainData = JSON.parse(JSON.stringify(fixture));
  delete plainData.topic.background_presets;
  const plain = page(plainData);
  assert.equal(stmt(plain, 'result', fixture.results[3]), 'A ∧ B ∧ H ∧ T ⇒ Z');
  assert.equal(stmt(plain, 'model', fixture.models[0]), 'A ∧ B ∧ ¬T ∧ ¬X');
  assert.equal(select(plain, 'result', 'full-result').querySelector('details.full-conjunction'), null);
  const fixedData = JSON.parse(JSON.stringify(fixture));
  fixedData.topic.background = ['h'];
  fixedData.results = fixedData.results.filter(r => r.id !== 'derive-h');
  assert.equal(stmt(page(fixedData), 'result', {premises: ['a', 'b'], conclusion: 'z'}), 'DU ⇒ Z');

  // Actual topic: Archimedean Outcomes is assumed; Simple EU is derived.
  // Both the old and new equivalent formulations can still abbreviate.
  const data = JSON.parse(fs.readFileSync(path.join(root, 'build/unbounded-utility/data.json'), 'utf8'));
  const real = page(data);
  const duPreset = data.topic.background_presets.find(p => p.id === 'du');
  const dtuPreset = data.topic.background_presets.find(p => p.id === 'dtu');
  assert.ok(duPreset.principles.includes('archimedean-outcomes'));
  assert.ok(!duPreset.principles.includes('simple-eu'));
  assert.ok(!duPreset.principles.includes('totality'));
  assert.equal(real.window.eval(`baseE.cl(${JSON.stringify(duPreset.principles)}).facts.has('simple-eu')`), true);
  assert.deepEqual([...dtuPreset.principles].sort(), [...duPreset.principles, 'totality'].sort());
  const oldDU = ['rich-outcomes', 'stochastic-equivalence', 'simple-eu', 'stochastic-dominance', 'independence'];
  assert.deepEqual(named(real, oldDU).presets.map(p => p.id), ['du']);
  assert.deepEqual(named(real, [...oldDU, 'totality']).presets.map(p => p.id), ['dtu']);
  assert.deepEqual(named(real, duPreset.principles).presets.map(p => p.id), ['du']);
  assert.deepEqual(named(real, ['rich-outcomes','archimedean-outcomes']).presets, []);
  const lex = data.models.find(m => m.id === 'lexicographic-folded-extension');
  assert.match(stmt(real, 'model', lex), /^DTU ∧ /);
  assert.match(stmt(real, 'model', lex), /¬L¹ Continuity/);
  const incomplete = data.models.find(m => m.id === 'cdf-conclosure-preorder');
  assert.match(stmt(real, 'model', incomplete), /^DU ∧ /);
  assert.match(stmt(real, 'model', incomplete), /¬Totality/);
  assert.doesNotMatch(stmt(real, 'model', incomplete), /DTU/);
  assert.deepEqual(errors, []);
  console.log('PASS: equivalent named conjunctions, DU/DTU distinction, extra and negative flags, source filters, conjecture isolation, and exact disclosures/writeups.');
} finally {
  pages.forEach(dom => dom.window.close());
}

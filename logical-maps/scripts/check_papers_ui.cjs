// NODE_PATH=/path/to/node_modules node scripts/check_papers_ui.cjs
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const data = JSON.parse(fs.readFileSync(path.join(root, 'build/unbounded-utility/data.json')));
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
  url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
  beforeParse(w) { w.matchMedia = () => ({matches: false, addEventListener() {}}); w.HTMLElement.prototype.scrollIntoView = function() {}; }
});
const w = dom.window, d = w.document;
try {
  assert.equal(d.querySelector('[data-tab="papers"]'), null);
  assert.ok(d.querySelector('#background #paper-catalogue'));
  assert.ok(d.querySelector('#source-literature #paper-wilkinson-2025'));
  assert.ok(d.querySelector('#other-literature #paper-bartha-2016'));
  assert.equal(d.querySelectorAll('#background #literature').length, 1);
  assert.equal(d.querySelectorAll('.paper-entry').length, data.papers.length);
  assert.equal(d.querySelectorAll('[data-source-filter]').length, data.topic.source_catalog.length);
  const filters = [...d.querySelectorAll('[data-source-filter]')].map(x => [x.dataset.sourceFilter, x.checked]);
  const graph = w.eval('JSON.stringify(buildGraph())');
  d.querySelector('[data-tab="background"]').click();
  const search = d.getElementById('paper-search');
  search.value = 'Independent Sum Consistency'; search.dispatchEvent(new w.Event('input'));
  assert.ok(d.getElementById('paper-wilkinson-2025'), 'Principle aliases find their papers');
  search.value = 'nothing matches this'; search.dispatchEvent(new w.Event('input'));
  assert.equal(d.querySelectorAll('.paper-entry').length, 0);
  w.openPaper('wilkinson-2025');
  assert.equal(search.value, '');
  assert.equal(d.activeElement.id, 'paper-wilkinson-2025');
  d.querySelector('#paper-wilkinson-2025 [data-open-principle="independent-sum-consistency"]').click();
  assert.equal(d.getElementById('pane-page').dataset.active, 'true');
  assert.match(d.getElementById('page').textContent, /mutually independent/);
  d.querySelector('#page [data-paper="wilkinson-2025"]').click();
  assert.equal(d.getElementById('pane-background').dataset.active, 'true');
  assert.equal(d.getElementById('pop').hidden, true);
  d.querySelector('#paper-wilkinson-2025 details summary').click();
  d.querySelector('#paper-wilkinson-2025 [data-open-result]').click();
  assert.equal(d.getElementById('pane-page').dataset.active, 'true');
  assert.match(d.getElementById('page').textContent, /Background:/);
  assert.equal(w.eval('JSON.stringify(buildGraph())'), graph, 'Catalogue does not affect logical evidence');
  assert.deepEqual([...d.querySelectorAll('[data-source-filter]')].map(x => [x.dataset.sourceFilter, x.checked]), filters);
  for (const [id, author] of [
    ['dominance-refutes-full-sum', 'Preference for Equivalent RVs'],
    ['rich-simple-sure-thing-refutes-countable', 'Infinite Prospects'],
    ['symmetric-dtu-refutes-independent-sum-candidate', 'Misc.']
  ]) {
    w.select({type: 'result', id});
    assert.ok(d.querySelector('#pop .badge.source').textContent.includes(author), id + ' has the corrected visible source badge');
  }
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: catalogue search, paper/record navigation, adaptation notes, and unchanged graph filters.');
} finally { w.close(); }

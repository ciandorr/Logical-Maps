// NODE_PATH=/path/to/node_modules node scripts/check_starter_ui.cjs /path/to/extracted/logical-maps-starter
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const starter = process.argv[2];
assert.ok(starter, 'Pass the extracted starter directory');
const errors = [], pages = [];
function page(file) {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
  const dom = new JSDOM(fs.readFileSync(file, 'utf8'), {url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
    beforeParse(w) { w.matchMedia = () => ({matches: false, addEventListener() {}}); }});
  pages.push(dom); return dom;
}
try {
  for (const topic of ['my-map', 'example']) {
    const dom = page(path.join(starter, 'build', topic, 'index.html')), d = dom.window.document;
    for (const tab of ['graph', 'models', 'open', 'results', 'contribute', 'background']) {
      const button = d.querySelector(`[data-tab="${tab}"]`); assert.ok(!button.hidden); button.click();
      assert.equal(d.getElementById('pane-' + tab).dataset.active, 'true');
    }
    d.querySelector('[data-tab="graph"]').click();
    const input = d.getElementById('graph-search'); input.value = 'reflexive';
    input.dispatchEvent(new dom.window.Event('input', {bubbles: true}));
    if (topic === 'my-map') {
      assert.equal(d.querySelectorAll('#graph .node').length, 0);
      assert.equal(d.getElementById('graph-search-status').textContent, 'No matching principles');
    } else {
      assert.ok(d.querySelector('#graph .node.search-current'));
      d.querySelector('[data-tab="open"]').click();
      assert.equal(d.querySelector('[data-conjecture-id="connected-symmetric-implies-transitive"]').dataset.resolution, 'open');
      d.querySelector('[data-tab="models"]').click();
      assert.ok(d.querySelector('[data-model="identity-on-two"]'));
    }
  }
  const dom = page(path.join(root, 'build/unbounded-utility/index.html')), d = dom.window.document;
  d.querySelector('[data-tab="contribute"]').click();
  const link = d.querySelector('#contribute a[href="logical-maps-starter.zip"]');
  assert.ok(link); assert.match(link.textContent, /starter project/);
  assert.ok(d.querySelector('#contribute a[href^="mailto:"]'), 'Original contribution contact remains');
  assert.ok(fs.existsSync(path.join(root, 'build/unbounded-utility', link.getAttribute('href'))));
  assert.equal(d.getElementById('pop').hidden, true);
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: blank and example starter viewers, tutorial conjecture, graph search, and the public Contribute download.');
} finally { pages.forEach(dom => dom.window.close()); }

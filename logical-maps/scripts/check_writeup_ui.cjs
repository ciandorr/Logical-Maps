// DOM check: the record page shows the full hand-written write-up once fetched,
// falls back to the record summary without fetch, and cross-links navigate in-app;
// a write-up also opens as a page of its own (#writeup/<id>).
const fs = require('fs'), path = require('path'), assert = require('assert');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const data = JSON.parse(fs.readFileSync(path.join(root, 'build/unbounded-utility/data.json')));
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(e));
function page(withFetch) {
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', ()=>JSON.stringify(data)), {runScripts: 'dangerously', url: 'http://localhost/unbounded-utility/index.html', virtualConsole: vc, pretendToBeVisual: true, beforeParse(w) {
    if (withFetch) w.fetch = url => Promise.resolve({ok: true, text: () => Promise.resolve(fs.readFileSync(path.join(root, 'build/unbounded-utility', url), 'utf8'))});
  }});
  return dom.window;
}
(async () => {
  // 1. without fetch: summary + note with the file path, no html/md links
  let w = page(false), d = w.document;
  w.openPage({type: 'model', id: 'finite-support-compensated-dominance'});
  let txt = d.getElementById('page').textContent;
  assert.match(txt, /full details are in the write-up/);
  assert.ok(d.querySelector('#page .writeup-note a[data-open-writeup-page="finite-support-compensated-dominance"][href="writeups/finite-support-compensated-dominance.html"]'), 'note links the write-up page');
  assert.ok(!d.querySelector('#page .links a[href$=".md"]'), 'no md link');
  assert.ok(!d.querySelector('#page .links a[href$=".html"]'), 'no html link');
  // 2. with fetch: full write-up replaces the summary; notes/sources/principles remain
  w = page(true); d = w.document;
  w.openPage({type: 'model', id: 'finite-support-compensated-dominance'});
  await new Promise(r => setTimeout(r, 300));
  txt = d.getElementById('page').textContent;
  assert.match(txt, /Further verified failures/, 'hand-written section present');
  assert.match(txt, /recorded as Existential Copula Sum\s+Invariance/, 'full text present');
  assert.ok(!/full details are in the write-up/.test(txt), 'note removed after load');
  assert.ok(!d.querySelector('#page nav.writeup-nav'), 'nav stripped');
  assert.ok(!d.querySelector('#page header#title-block-header'), 'title block stripped');
  assert.ok(d.querySelector('#page h2') && /Principles/.test(txt) && /Record provenance/.test(txt), 'derived sections kept');
  // 3. cross-link to another record navigates in-app
  const link = d.querySelector('#page .writeup a[data-open-writeup]');
  assert.ok(link, 'has an in-app cross-link');
  const target = link.dataset.openWriteup;
  link.click();
  await new Promise(r => setTimeout(r, 300));
  assert.equal(d.getElementById('pane-page').dataset.active, 'true');
  assert.ok(d.getElementById('page').textContent.includes((data.results.find(r => r.id === target) || data.models.find(m => m.id === target)).file), 'navigated to ' + target);
  // 4. result with hand-written write-up
  w.openPage({type: 'result', id: 'levy-refutes-neutral-independent-preservation'});
  await new Promise(r => setTimeout(r, 300));
  assert.match(d.getElementById('page').textContent, /positive stable\s+variable/);
  // 5. popup write-up button still opens the page (used by other checks)
  w.select({type: 'model', id: 'eventual-clipped-expectation'});
  d.querySelector('#pop [data-goto]').click();
  assert.equal(d.getElementById('pane-page').dataset.active, 'true');
  // 6. "write-up" in a record's prose links to its write-up, which opens as a page of its own
  w = page(false); d = w.document;
  w.openPage({type: 'result', id: 'levy-refutes-neutral-independent-preservation'});
  assert.ok(d.querySelectorAll('#page .record-summary .prose a[data-open-writeup-page="levy-refutes-neutral-independent-preservation"]').length, 'prose mention links the write-up');
  w = page(true); d = w.document;
  w.openPage({type: 'result', id: 'levy-refutes-neutral-independent-preservation'});
  w.openPage({type: 'writeup', id: 'levy-refutes-neutral-independent-preservation'});
  await new Promise(r => setTimeout(r, 300));
  assert.equal(w.location.hash, '#writeup/levy-refutes-neutral-independent-preservation');
  assert.match(d.querySelector('#page .writeup-body').textContent, /positive stable\s+variable/, 'write-up page filled');
  assert.ok(d.querySelector('#page button[data-open-result="levy-refutes-neutral-independent-preservation"]'), 'write-up page links its record');
  d.getElementById('page-back').click();
  assert.match(d.getElementById('page').textContent, /Premises/, 'back returns to the record');
  assert.deepEqual(errors.map(String), []);
  console.log('PASS: write-up page shows the full hand-written write-up, falls back cleanly, and cross-links in-app; prose mentions open the write-up as its own page.');
})().catch(e => { console.error(e); process.exit(1); });

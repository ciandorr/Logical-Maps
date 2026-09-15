// NODE_PATH=/path/to/node_modules node scripts/check_details_pane_ui.cjs
// Resize interaction, cancellation and persistence must preserve selection and proofs.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const template = fs.readFileSync(path.resolve(__dirname, '../viewer/template.html'), 'utf8');
const certificate = {source_id: 'paper', lean: 'none'};
const data = {
  topic: {id: 'pane', title: 'Pane', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['a','b','x'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [{id: 'ab', premises: ['a'], conclusion: 'b', status: 'proved', certificate},
    {id: 'xf', premises: ['x'], conclusion: 'false', status: 'proved', certificate}], models: []
};
const pages = [], errors = [], storageKey = 'principle-map:pane-sizes:v1';
let height = 700;
function page(stored, blocked = false) {
  const vc = new VirtualConsole(); vc.on('jsdomError', e => errors.push(String(e)));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
    url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
    beforeParse(w) {
      Object.defineProperty(w.HTMLElement.prototype, 'clientHeight', {get() { return height; }});
      Object.defineProperty(w.HTMLElement.prototype, 'clientWidth', {get() { return 1200; }});
      if (blocked) Object.defineProperty(w, 'localStorage', {get() { throw new Error('Storage disabled'); }});
      else if (stored) w.localStorage.setItem(storageKey, stored);
    }
  });
  pages.push(dom); return dom.window;
}
const size = w => Number(w.document.getElementById('details-divider').getAttribute('aria-valuenow'));
const key = (w, value, shiftKey = false) => w.document.getElementById('details-divider').dispatchEvent(new w.KeyboardEvent('keydown', {key: value, shiftKey, bubbles: true}));
function pointer(w, target, type, y) {
  target.dispatchEvent(new w.MouseEvent(type, {button: 0, clientY: y, bubbles: true}));
}
try {
  const w = page(JSON.stringify({sidebar: 230, background: 155})), d = w.document;
  const handle = d.getElementById('details-divider'), pane = d.getElementById('graph-details'), legend = d.getElementById('relation-legend');
  w.select({type: 'principle', id: 'a'});
  const pop = d.getElementById('pop'), definition = pop.innerHTML;
  assert.equal(handle.getAttribute('role'), 'separator');
  assert.equal(handle.getAttribute('aria-orientation'), 'horizontal');
  assert.equal(handle.nextElementSibling, pane);
  assert.equal(legend.parentElement, pane);
  assert.equal(pane.firstElementChild, legend, 'Legend stays above the scrolling details');
  assert.equal(w.getComputedStyle(pop).overflow, 'auto');
  const initial = size(w);
  key(w, 'ArrowUp'); assert.equal(size(w), initial + 10);
  key(w, 'ArrowUp', true); assert.equal(size(w), initial + 50);
  key(w, 'ArrowDown'); assert.equal(size(w), initial + 40);
  assert.equal(w.eval('state.focus'), 'a'); assert.equal(pop.innerHTML, definition);
  assert.equal(pop.hidden, false, 'Resizing keeps the description open');
  const remembered = w.localStorage.getItem(storageKey), restored = page(remembered);
  assert.equal(size(restored), size(w), 'Height survives a reload');
  assert.equal(JSON.parse(remembered).sidebar, 230); assert.equal(JSON.parse(remembered).background, 155);
  key(w, 'End'); assert.equal(size(w), Number(handle.getAttribute('aria-valuemax')));
  key(w, 'Home'); assert.equal(size(w), Number(handle.getAttribute('aria-valuemin')));
  key(w, 'Enter'); assert.equal(size(w), initial);
  pointer(w, handle, 'pointerdown', 400); pointer(w, w, 'pointermove', 330);
  assert.equal(size(w), initial + 70, 'Dragging upward enlarges the bottom pane');
  pointer(w, w, 'pointerup', 330);
  assert.equal(JSON.parse(w.localStorage.getItem(storageKey)).details, initial + 70);
  const beforeCancel = size(w);
  pointer(w, handle, 'pointerdown', 400); pointer(w, w, 'pointermove', 360);
  key(w, 'Escape');
  assert.equal(size(w), beforeCancel, 'Escape cancels a resize');
  assert.equal(w.eval('state.focus'), 'a', 'Escape during resizing preserves selection');
  assert.equal(pop.hidden, false);
  assert.ok(!d.body.classList.contains('resizing-panes'));
  pointer(w, handle, 'pointerdown', 400); pointer(w, w, 'pointermove', 350); pointer(w, w, 'pointercancel', 350);
  assert.equal(size(w), beforeCancel, 'Cancelled touch/pointer resizing restores the previous size');
  handle.dispatchEvent(new w.MouseEvent('dblclick', {bubbles: true})); assert.equal(size(w), initial);
  assert.ok(!Object.hasOwn(JSON.parse(w.localStorage.getItem(storageKey)), 'details'));
  key(w, 'End');
  height = 320; w.dispatchEvent(new w.Event('resize'));
  assert.ok(size(w) <= 320 - 128 - 9, 'Small windows retain room for the graph');
  assert.ok(size(w) >= 112, 'Small windows retain room for details');
  height = 700; w.dispatchEvent(new w.Event('resize'));
  assert.equal(size(w), Number(handle.getAttribute('aria-valuemax')), 'Returning to a larger window restores the preferred height');
  d.querySelector('[data-tab="open"]').click(); d.querySelector('[data-tab="graph"]').click();
  assert.equal(size(w), Number(handle.getAttribute('aria-valuemax')), 'Switching tabs preserves the size');
  const noStorage = page(null, true), noStorageInitial = size(noStorage);
  key(noStorage, 'ArrowUp'); assert.equal(size(noStorage), noStorageInitial + 10);
  assert.deepEqual(errors, []);
  console.log('PASS: bottom pane with integrated legend, drag/keyboard resizing, limits, reset, persistence, cancellation without losing selection, tab changes, and unavailable storage.');
} finally { pages.forEach(p => p.window.close()); }

// NODE_PATH=/path/to/node_modules node scripts/check_multiselect_ui.cjs
// Joint selection must preserve the user's choices, even when they are related.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const certificate = {source_id: 'paper', lean: 'none'};
const rule = (id, premises, conclusion) => ({id, premises, conclusion, status: 'proved', certificate});
const data = {
  topic: {id: 'selection', title: 'Selection', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'].map(id => ({id, name: id.toUpperCase(), statement: 'Definition of ' + id.toUpperCase()})),
  results: [rule('ab', ['a'], 'b'), rule('acd', ['a', 'c'], 'd'), rule('da', ['d'], 'a'), rule('dc', ['d'], 'c'),
    rule('acef', ['a', 'c', 'e'], 'f'), rule('bh', ['b'], 'h'), rule('hb', ['h'], 'b'), rule('cgf', ['c', 'g'], false)],
  models: [{id: 'joint', name: 'Joint model', status: 'proved', satisfies: ['a', 'c', 'e'], violates: ['g'], certificate}]
};
const errors = [], vc = new VirtualConsole(); vc.on('jsdomError', error => errors.push(String(error)));
const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
  url: 'https://maps.example/', runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
  beforeParse(w) { w.SVGElement.prototype.setPointerCapture = () => {}; }
});
const w = dom.window, d = w.document, graph = d.getElementById('graph'), pop = d.getElementById('pop');
const label = id => d.querySelector(`#nodes [data-principle="${id}"]`);
const node = id => label(id).closest('.node');
const focus = () => JSON.parse(w.eval('JSON.stringify(expressionLiterals(state.focus))'));
function pointer(target, extend = false) {
  target.dispatchEvent(new w.MouseEvent('pointerdown', {bubbles: true, button: 0, shiftKey: extend, clientX: 30, clientY: 40}));
  graph.dispatchEvent(new w.MouseEvent('pointerup', {bubbles: true, button: 0, shiftKey: extend}));
}
const shift = id => pointer(label(id), true);
function selected(ids) {
  assert.deepEqual(focus(), ids);
  for (const id of ids) {
    assert.ok(label(id).classList.contains('selection-member'), id + ' is explicitly marked');
    assert.ok(node(id).classList.contains('selected'), id + ' has a selected box');
    const sidebarLabel = d.querySelector(`#pr-filters [data-principle="${id}"]`);
    if (sidebarLabel) assert.equal(sidebarLabel.getAttribute('aria-pressed'), 'true');
  }
  if (ids.length > 1) assert.deepEqual([...pop.querySelectorAll('[data-remove-selection]')].map(b => b.dataset.removeSelection), ids);
}
try {
  pointer(label('a'));
  assert.equal(pop.parentElement.id, 'graph-details');
  assert.equal(w.getComputedStyle(pop).position, 'static', 'Details participate in the page layout');
  assert.ok(d.querySelector('.graph-workspace').contains(graph));
  assert.ok(!d.querySelector('.graph-area').contains(pop), 'Details occupy space outside the graph viewport');
  assert.equal(pop.style.left, ''); assert.equal(pop.style.top, '');
  const drawing = graph.innerHTML;
  d.getElementById('fit').dispatchEvent(new w.MouseEvent('pointerdown', {bubbles: true}));
  assert.equal(pop.hidden, false, 'Docked descriptions stay available during graph interactions');
  pop.querySelector('.detail-close').click();
  assert.equal(pop.hidden, true);
  assert.equal(graph.innerHTML, drawing, 'Closing details does not redraw the graph');
  assert.equal(d.querySelector('.graph-workspace').children.length, 2, 'Space for details remains reserved');

  shift('b'); selected(['a', 'b']); // A entails B; both remain selected.
  assert.equal(w.eval('state.selected.type'), 'selection');
  assert.match(pop.textContent, /Joint consistency.*consistent/s);
  shift('c'); selected(['a', 'b', 'c']); // A ∧ C is already drawn inside D.
  assert.ok(node('d').classList.contains('rel-entailed'));
  shift('d'); selected(['a', 'b', 'c', 'd']); // Selecting that equivalent result also works.
  shift('e'); selected(['a', 'b', 'c', 'd', 'e']);
  assert.ok(node('f').classList.contains('rel-entailed'), 'Shading uses the entire joint selection');
  shift('h'); selected(['a', 'b', 'c', 'd', 'e', 'h']); // B and H share an equivalence box.
  shift('b'); selected(['a', 'c', 'd', 'e', 'h']);
  assert.ok(!label('b').classList.contains('selection-member'), 'Equivalent labels remain individually selectable');
  pop.querySelector('[data-remove-selection="h"]').click(); selected(['a', 'c', 'd', 'e']);
  pop.querySelector('details').open = true;
  assert.match(pop.textContent, /Definition of A/);

  // The existing conjunction is selected as a set, and modifiers toggle that set.
  pointer(d.querySelector('[data-graph-node="j:acd"] circle'));
  assert.deepEqual(focus(), ['a', 'c']);
  assert.ok(label('a').classList.contains('selection-member'));
  assert.ok(label('c').classList.contains('selection-member'));
  shift('e'); selected(['a', 'c', 'e']);
  pointer(d.querySelector('[data-graph-node="j:acd"] circle'), true);
  assert.deepEqual(focus(), ['e']);
  pointer(d.querySelector('[data-graph-node="j:acd"] circle'), true);
  selected(['e', 'a', 'c']);
  assert.ok(d.querySelector('[data-graph-node="j:acef"]').classList.contains('selected'), 'Conjunction identity ignores click order');

  // Proof strokes can cross a box containing a conjunction. A Shift-click
  // there still adds the box's principle. Reading an arrow then keeps the set.
  const stroke = node('d').querySelector('.edge-hit');
  assert.ok(stroke, 'Fixture has an interior proof stroke');
  pointer(stroke, true); selected(['e', 'a', 'c', 'd']);
  pointer(d.querySelector('[data-edge="ab"] .edge'));
  assert.notEqual(w.eval('state.selected.type'), 'selection');
  assert.deepEqual(focus(), ['e', 'a', 'c', 'd'], 'Reading proof preserves the selection');
  shift('b'); selected(['e', 'a', 'c', 'd', 'b']);

  // A joint selection remains available to the explicit comparison action.
  pop.querySelector('[data-compare-arm]').click(); pointer(label('f'));
  assert.equal(w.eval('state.selected.type'), 'compare');
  assert.match(pop.textContent, /E ∧ A ∧ C ∧ D ∧ B ⇒ F.*proved/s);
  assert.equal(pop.parentElement.id, 'graph-details');
  shift('g');
  assert.ok(!graph.classList.contains('shaded'), 'An inconsistent joint selection never shades explosion');
  assert.match(d.getElementById('relation-legend').textContent, /inconsistent/);
  assert.ok(label('g').classList.contains('selection-member'));
  shift('g');
  assert.ok(graph.classList.contains('shaded'));

  // Sidebar modifiers use the same selection, including negative literals.
  pointer(label('a'));
  d.querySelector('#pr-filters [data-principle="e"]').dispatchEvent(new w.MouseEvent('click', {bubbles: true, shiftKey: true}));
  selected(['a', 'e']);
  d.querySelector('[data-show-negative="g"]').click();
  shift('!g'); selected(['a', 'e', '!g']);
  pop.querySelector('[data-remove-selection="!g"]').click(); selected(['a', 'e']);
  shift('e'); assert.deepEqual(focus(), ['a']);
  shift('a'); assert.equal(w.eval('state.focus'), null); assert.equal(pop.hidden, true);
  pointer(label('a')); shift('e');
  pointer(graph); assert.equal(w.eval('state.focus'), null);
  pointer(label('a')); shift('e');
  d.dispatchEvent(new w.KeyboardEvent('keydown', {key: 'Escape', bubbles: true}));
  assert.equal(w.eval('state.focus'), null); assert.equal(pop.hidden, true);

  // Other tabs keep their own detail surface; returning never overlays the graph.
  d.querySelector('[data-tab="models"]').click();
  w.select({type: 'model', id: 'joint'});
  assert.equal(pop.parentElement.id, 'floating-details');
  d.querySelector('[data-tab="graph"]').click();
  assert.equal(pop.parentElement.id, 'graph-details'); assert.equal(pop.hidden, true);
  pointer(label('a')); pop.querySelector('[data-goto]').click();
  assert.equal(d.getElementById('pane-page').dataset.active, 'true'); assert.equal(pop.hidden, true);
  d.getElementById('page-back').click(); pointer(label('a'));
  assert.equal(pop.parentElement.id, 'graph-details');
  assert.deepEqual(errors, []);
  console.log('PASS: unlimited joint selection, related/equivalent principles, conjunctions, proof-stroke hit targets, sidebar/negative selections, comparison, no explosion, and dedicated graph details.');
} finally { w.close(); }

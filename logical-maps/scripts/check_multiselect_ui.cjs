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
  assert.equal(d.querySelector('.graph-workspace').children.length, 3, 'The graph, divider and details keep their reserved space');
  assert.equal(d.getElementById('relation-legend').parentElement.id, 'graph-details');

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

  // Further related principles extend the same joint selection.
  assert.equal(pop.querySelector('[data-compare-arm]'), null);
  shift('f'); selected(['e', 'a', 'c', 'd', 'b', 'f']);
  assert.equal(pop.parentElement.id, 'graph-details');
  shift('g');
  assert.ok(graph.classList.contains('inconsistent-selection'));
  for (const n of graph.querySelectorAll('#nodes .node')) assert.ok(n.classList.contains('rel-excluded'), 'An inconsistent joint selection highlights every box red');
  assert.match(d.getElementById('graph-details-foot').textContent, /inconsistent/);
  assert.ok(label('g').classList.contains('selection-member'));
  shift('g');
  assert.ok(graph.classList.contains('shaded'));
  assert.ok(!graph.classList.contains('inconsistent-selection'), 'Removing the conflict restores ordinary shading');

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
  pointer(label('a')); d.querySelector('#relation-legend [data-goto]').click();
  assert.equal(d.getElementById('pane-page').dataset.active, 'true'); assert.equal(pop.hidden, true);
  d.getElementById('page-back').click(); pointer(label('a'));
  assert.equal(pop.parentElement.id, 'graph-details');
  // The sidebar's moves offered from the details pane: hide, add negations,
  // move to background. Each is exactly the sidebar's own action.
  const action = kind => d.querySelector(`#relation-legend [data-selection-action="${kind}"]`);
  pointer(label('e'));
  assert.ok(action('hide') && action('negate') && action('background'), 'A selected principle offers the three moves');
  assert.equal(action('negate').textContent, 'Add negation');
  action('negate').click();
  assert.ok(w.eval('state.negativeShown.has("e")'), 'Adding the negation checks ✗ in the sidebar');
  assert.ok(d.querySelector('#nodes [data-principle="!e"]'), 'And ¬E joins the graph');
  assert.deepEqual(focus(), ['e'], 'The selection stays');
  assert.ok(!action('negate'), 'The offer is withdrawn once the negation is shown');
  action('hide').click();
  assert.ok(w.eval('state.excluded.has("e")'), 'Hiding unchecks ✓ in the sidebar');
  assert.ok(!label('e') || !label('e').closest('.node'), 'E leaves the graph');
  assert.ok(d.querySelector('#nodes [data-principle="!e"]'), 'While ¬E, shown separately, stays');
  assert.equal(w.eval('state.focus'), null, 'And nothing is selected any more');
  w.eval('state.excluded.delete("e"); state.negativeShown.delete("e"); repaintGraph();');
  pointer(label('a')); shift('e');
  assert.equal(action('negate').textContent, 'Add negations', 'A joint selection speaks in the plural');
  action('background').click();
  assert.ok(w.eval('background.has("a") && background.has("e")'), 'Moving to background assumes both');
  assert.ok(d.querySelector('#pr-filters [data-pr-row="a"]').classList.contains('in-background'), 'As the sidebar shows');
  assert.equal(w.eval('state.focus'), null);
  w.eval('resetBackground()');

  // Equivalent principles share a box, so one of them says everything the
  // others do. Selecting one offers to clear the rest out of it.
  pointer(label('b'));
  assert.ok(action('equivalents'), 'A principle with a shown equivalent offers to hide it');
  assert.equal(action('equivalents').textContent, 'hide equivalents');
  action('equivalents').click();
  assert.ok(w.eval('state.excluded.has("h")'), 'Which unchecks the equivalent in the sidebar');
  assert.ok(!w.eval('state.excluded.has("b")'), 'And leaves the selection itself on the graph');
  assert.equal(action('equivalents'), null, 'The offer is withdrawn once nothing is left to hide');
  w.eval('state.excluded.delete("h"); repaintGraph();');
  pointer(label('a'));
  assert.equal(action('equivalents'), null, 'A principle with no equivalent is offered nothing');

  // The map's other names for what is selected, with the moves that trade one
  // for another. B and H entail each other, so each is the other's other name.
  pointer(label('b'));
  const names = () => [...pop.querySelectorAll('.equivalent-names li [data-principle]')].map(b => b.dataset.principle);
  const control = (kind, id) => pop.querySelector(`[data-equivalent-${kind}="${id}"]`);
  assert.deepEqual(names(), ['h'], 'The equivalent principle is listed');
  assert.equal(control('show', 'h').textContent, 'hide', 'One the graph is showing offers to hide');
  control('show', 'h').click();
  assert.ok(w.eval('state.excluded.has("h")'), 'Which takes it off the graph');
  assert.equal(control('show', 'h').textContent, 'show', 'And then offers to bring it back');
  control('show', 'h').click();
  assert.ok(!w.eval('state.excluded.has("h")'));
  control('replace', 'h').click();
  assert.equal(w.eval('state.focus'), 'h', 'Replace selects the equivalent');
  assert.ok(w.eval('state.excluded.has("b")'), 'Hides what was selected');
  assert.ok(!w.eval('state.excluded.has("h")'), 'And leaves it showing in its place');
  assert.deepEqual(names(), ['b'], 'So the list offers the trade back');
  assert.equal(names().length, [...pop.querySelectorAll('.equivalent-names li')].length);
  w.eval('state.excluded.delete("b"); repaintGraph();');
  pointer(label('a'));
  assert.equal(pop.querySelector('.equivalent-names'), null, 'A principle with no equivalent gets no list');
  pointer(label('a'));
  assert.deepEqual(errors, []);
  console.log('PASS: unlimited joint selection, related/equivalent principles, conjunctions, proof-stroke hit targets, sidebar/negative selections, red inconsistency highlighting, bottom graph details, and hide / add negation / move to background offered on the selection.');
} finally { w.close(); }

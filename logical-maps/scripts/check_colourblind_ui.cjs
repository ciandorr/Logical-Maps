// NODE_PATH=/path/to/node_modules node scripts/check_colourblind_ui.cjs
// Exercise the shared theme assets through the same embedding as exported maps.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {execFileSync} = require('node:child_process');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const heads = JSON.parse(execFileSync('python3', ['-c',
  'import json; from scripts.pmap import theme_head; print(json.dumps({t:theme_head(t) for t in ["unbounded-utility","intuitionisticism"]}))'
], {cwd: root, encoding: 'utf8'}));
const certificate = {source_id: 'paper', lean: 'none'};
const data = {
  topic: {id: 'palette', title: 'Palette', background: [], source_catalog: [{id: 'paper', name: 'Paper', kind: 'published-paper'}]},
  principles: ['a', 'b', 'c', 'd', 'e'].map(id => ({id, name: id.toUpperCase(), statement: id})),
  results: [{id: 'ab', premises: ['a'], conclusion: 'b', status: 'proved', certificate},
    {id: 'acf', premises: ['a', 'c'], conclusion: false, status: 'proved', certificate}],
  models: [{id: 'yes', name: 'Yes', status: 'proved', satisfies: ['a', 'd'], violates: [], certificate},
    {id: 'no', name: 'No', status: 'proved', satisfies: ['a'], violates: ['d'], certificate}]
};
const pages = [], errors = [];
async function page(topic = 'unbounded-utility', saved = {}, blocked = false) {
  const system = {matches: false, addEventListener(_, handler) { this.change = handler; }};
  const vc = new VirtualConsole(); vc.on('jsdomError', error => errors.push(String(error)));
  const dom = new JSDOM(template.replace('<!--__PMAP_THEME__-->', heads[topic]).replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
    url: `https://maps.example/${topic}/`, runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: vc,
    beforeParse(w) {
      w.matchMedia = query => query === '(prefers-color-scheme: dark)' ? system : {matches: true, addEventListener() {}};
      if (blocked) Object.defineProperty(w, 'localStorage', {get() { throw new Error('Storage denied'); }});
      else for (const [key, value] of Object.entries(saved)) w.localStorage.setItem(key, value);
    }
  });
  pages.push(dom);
  // Preferences are applied in the head, before the body finishes loading.
  assert.equal(dom.window.document.documentElement.dataset.palette, saved['pmap-palette'] === 'colourblind' && !blocked ? 'colourblind' : 'default');
  await new Promise(resolve => dom.window.document.addEventListener('DOMContentLoaded', resolve, {once: true}));
  return {w: dom.window, d: dom.window.document, system};
}
const property = (page, key) => page.w.getComputedStyle(page.d.documentElement).getPropertyValue(key).trim();
const palette = page => {
  const css = page.w.getComputedStyle(page.d.documentElement);
  return Object.fromEntries([...css].filter(key => key.startsWith('--')).map(key => [key, css.getPropertyValue(key).trim()]));
};
const themeButton = p => p.d.querySelector('[data-theme-toggle]');
const paletteButton = p => p.d.querySelector('[data-colourblind-toggle]');
function checkModes(p, theme, colourblind) {
  assert.equal(p.d.documentElement.dataset.theme, theme);
  assert.equal(p.d.documentElement.dataset.palette, colourblind ? 'colourblind' : 'default');
  assert.equal(paletteButton(p).getAttribute('aria-pressed'), String(colourblind));
  assert.equal(paletteButton(p).getAttribute('aria-label'), 'Colourblind mode');
  assert.match(paletteButton(p).textContent, colourblind ? /on/ : /off/);
}
(async () => {
  try {
    const utility = await page(), intuition = await page('intuitionisticism');
    const originals = [palette(utility), palette(intuition)];
    assert.notEqual(originals[0]['--bg'], originals[1]['--bg'], 'Default topic palettes differ');
    const shared = {};
    for (const [index, p] of [utility, intuition].entries()) {
      p.w.select({type: 'principle', id: 'a'});
      const graph = p.d.getElementById('graph'), drawing = graph.innerHTML, url = p.w.location.href;
      const legend = p.d.getElementById('relation-legend').textContent;
      checkModes(p, 'light', false);
      paletteButton(p).click(); checkModes(p, 'light', true);
      assert.equal(property(p, '--rel-positive'), '#56b4e9');
      assert.equal(property(p, '--rel-negative'), '#e69f00');
      if (index === 0) shared.light = palette(p);
      else assert.deepEqual(palette(p), shared.light, 'Every light colour matches across topics');
      themeButton(p).click(); checkModes(p, 'dark', true);
      if (index === 0) shared.dark = palette(p);
      else assert.deepEqual(palette(p), shared.dark, 'Every dark colour matches across topics');
      assert.notEqual(property(p, '--bg'), shared.light['--bg']);
      assert.equal(property(p, '--rel-positive'), '#56b4e9', 'Positive hue survives dark mode');
      assert.equal(property(p, '--rel-negative'), '#e69f00', 'Negative hue survives dark mode');
      assert.equal(graph.innerHTML, drawing, 'Toggles recolour the existing drawing without redrawing or moving nodes');
      assert.equal(p.w.eval('state.focus'), 'a');
      assert.equal(p.d.getElementById('relation-legend').textContent, legend);
      assert.equal(p.w.location.href, url, 'Display preferences preserve map URL assumptions');
      assert.equal(p.w.localStorage.getItem('pmap-theme'), 'dark');
      assert.equal(p.w.localStorage.getItem('pmap-palette'), 'colourblind');
      paletteButton(p).click(); checkModes(p, 'dark', false);
      assert.notEqual(property(p, '--bg'), shared.dark['--bg'], 'Turning off the palette restores the topic dark theme');
      themeButton(p).click(); checkModes(p, 'light', false);
      assert.deepEqual(palette(p), originals[index], 'Both toggles off restore the original topic palette');
    }
    // Loading another map respects each of the four saved combinations.
    for (const theme of ['light', 'dark']) for (const colourblind of [false, true]) {
      const p = await page('intuitionisticism', {'pmap-theme': theme, 'pmap-palette': colourblind ? 'colourblind' : 'default'});
      checkModes(p, theme, colourblind);
      if (colourblind) assert.deepEqual(palette(p), shared[theme]);
    }
    // System theme and cross-tab preference changes never switch the other setting.
    const p = await page('intuitionisticism');
    paletteButton(p).click();
    p.system.matches = true; p.system.change(); checkModes(p, 'dark', true);
    p.w.dispatchEvent(new p.w.StorageEvent('storage', {key: 'pmap-theme', newValue: 'light'}));
    checkModes(p, 'light', true);
    p.system.change(); checkModes(p, 'light', true); // Explicit theme beats system.
    p.w.dispatchEvent(new p.w.StorageEvent('storage', {key: 'pmap-palette', newValue: 'default'}));
    checkModes(p, 'light', false);
    p.w.dispatchEvent(new p.w.StorageEvent('storage', {key: 'pmap-palette', newValue: 'colourblind'}));
    checkModes(p, 'light', true);
    p.w.dispatchEvent(new p.w.StorageEvent('storage', {key: null, newValue: null}));
    checkModes(p, 'dark', false); // Cleared storage returns to system theme.
    for (const blocked of [false, true]) {
      const q = await page('unbounded-utility', {'pmap-theme': 'invalid', 'pmap-palette': 'invalid'}, blocked);
      checkModes(q, 'light', false);
      paletteButton(q).click(); themeButton(q).click(); checkModes(q, 'dark', true);
      paletteButton(q).click(); checkModes(q, 'dark', false);
    }
    assert.deepEqual(errors, []);
    console.log('PASS: independent dark/colourblind toggles, identical palettes across topics, graph preservation, persistence, system/cross-tab changes, and unavailable storage.');
  } finally { pages.forEach(p => p.window.close()); }
})().catch(error => { console.error(error); process.exitCode = 1; });

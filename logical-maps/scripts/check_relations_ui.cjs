// NODE_PATH=/path/to/node_modules node scripts/check_relations_ui.cjs
// Non-implications on the graph: clicking a principle shades every other
// principle by its relation (entailed, excluded, separated by a model, open),
// Shift-click or "Compare with…" reads two principles against each other,
// arrow popups report the converse and premise necessity, and hollow
// arrowheads mark open converses. Nothing here may assert more than the
// engine knows.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
function page(data,url='https://maps.example/'){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);return dom;}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture',checked_by:[]});
const rule=(id,premises,conclusion,status='proved',source='paper')=>({id,premises,conclusion,status,certificate:cert(source),sources:['Fixture'],source_names:['Fixture']});
const model=(id,satisfies,violates,source='submission',status='proved')=>({id,name:'Model '+id.toUpperCase(),status,satisfies,violates,certificate:cert(source),sources:['Fixture'],source_names:['Fixture']});
const topic={id:'relations',title:'Relations fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'},{id:'submission',name:'Submission',kind:'online-submission'}]};
const ids=['a','b','c','d','e','f','g','h','z'];
const fixture={topic,principles:ids.map(id=>({id,name:id.toUpperCase(),statement:'Principle '+id})),
  results:[rule('ab',['a'],'b'),rule('acf',['a','c'],false),rule('ga',['g'],'a'),rule('ha',['h'],'a'),rule('zf',['z'],false),rule('bd',['b','f'],'d')],
  models:[model('m1',['a'],['d']),model('m2',['a','d'],[]),model('m3',['a'],['g'])]};
const dom=page(fixture),w=dom.window,d=w.document;
const node=id=>[...d.querySelectorAll('#graph .node')].find(n=>(n.dataset.members||'').split(',').includes(id));
const rel=id=>[...node(id).classList].filter(c=>c.startsWith('rel-'));
const legend=()=>d.getElementById('relation-legend');
const pop=()=>d.getElementById('pop');
try{
  // Shading relative to A.
  w.select({type:'principle',id:'a'});
  assert.equal(w.eval('state.focus'),'a');
  assert.ok(d.getElementById('graph').classList.contains('shaded'));
  assert.deepEqual(rel('a'),['rel-base']);
  assert.deepEqual(rel('b'),['rel-entailed'],'A ⇒ B');
  assert.deepEqual(rel('c'),['rel-excluded'],'A ∧ C ⇒ ⊥');
  assert.deepEqual(rel('d'),['rel-separated'],'A ⇏ D by M1');
  assert.deepEqual(rel('e'),['rel-open']);
  assert.deepEqual(rel('f'),['rel-separated'],'Adjoining F to M1 would force D, which M1 violates');
  assert.deepEqual(rel('g'),['rel-separated'],'M3 satisfies A and violates G');
  assert.deepEqual(rel('h'),['rel-open']);
  assert.deepEqual(rel('z'),['rel-inconsistent'],'Z is refuted by the background, not by A');
  assert.equal(node('b').querySelector('.rel-mark').textContent,'⇒');
  assert.equal(node('e').querySelector('.rel-mark').textContent,'?');
  assert.match(node('d').querySelector('title').textContent,/not entailed by/);
  assert.equal(legend().hidden,false);
  assert.match(legend().textContent,/Relative to A:/);
  for(const key of ['entailed 1','excluded 1','separated by a model 3','open 2','inconsistent 1']) assert.ok(legend().textContent.includes(key),`legend shows ${key}: ${legend().textContent}`);
  assert.match(pop().textContent,/shades each principle/);

  // Reading an arrow keeps the shading; hovering dims gently rather than hiding it.
  w.eval("selectGraphEdge(graphEdgesByKey.get('ab'))");
  assert.equal(w.eval('state.selected.type'),'result');
  assert.deepEqual(rel('b'),['rel-entailed'],'An arrow popup does not drop the shading');
  assert.equal(legend().hidden,false);
  assert.match(pop().textContent,/Converse/);
  assert.match(pop().textContent,/B ⇒ A[\s\S]*open/,'The converse of A ⇒ B is open');
  w.hover({node:node('e').dataset.class});
  assert.ok(node('b').classList.contains('dim'));
  assert.ok(d.getElementById('graph').classList.contains('shaded'));
  w.hover(null);

  // Multi-premise arrows report what each premise buys.
  w.eval("selectGraphEdge(graphEdgesByKey.get('bd'))");
  assert.match(pop().textContent,/Without each premise/);
  assert.match(pop().textContent,/B ⇒ D/);assert.match(pop().textContent,/F ⇒ D/);
  w.eval("selectGraphEdge(graphEdgesByKey.get('acf'))");
  assert.match(pop().textContent,/Without each premise[\s\S]*A[\s\S]*consistent/,'Dropping C leaves a satisfiable A');

  // Compare by Shift-click.
  w.select({type:'principle',id:'a'});
  w.handleGraphClick(node('d').querySelector('rect'),true);
  assert.equal(w.eval('state.selected.type'),'compare');
  assert.equal(w.eval('state.selected.a+"|"+state.selected.b'),'a|d');
  assert.match(pop().textContent,/A ⇒ D[\s\S]*refuted by a model/);
  assert.match(pop().textContent,/D ⇒ A[\s\S]*open/);
  assert.match(pop().textContent,/A ∧ D[\s\S]*consistent/);
  assert.ok([...pop().querySelectorAll('button[data-model]')].some(b=>b.dataset.model==='m1'),'The separating model is linked');
  assert.ok([...pop().querySelectorAll('button[data-model]')].some(b=>b.dataset.model==='m2'),'The joint witness is linked');
  assert.ok(node('a').classList.contains('selected')&&node('d').classList.contains('selected'));
  assert.deepEqual(rel('b'),['rel-entailed'],'Shading stays relative to A while comparing');

  // Compare with… arms the next principle click, from the graph or the sidebar.
  w.select({type:'principle',id:'a'});
  pop().querySelector('button[data-compare-arm]').click();
  assert.equal(w.eval('state.compareArmed'),true);
  assert.match(legend().textContent,/Click a principle to compare/);
  d.querySelector('#pr-filters button[data-principle="b"]').click();
  assert.equal(w.eval('state.selected.type'),'compare');
  assert.match(pop().textContent,/A ⇒ B[\s\S]*proved/);
  assert.match(pop().textContent,/B ⇒ A[\s\S]*open/);
  assert.equal(w.eval('state.compareArmed'),false);

  // A background-inconsistent focus shades nothing (no explosion).
  w.select({type:'principle',id:'z'});
  assert.equal(d.getElementById('graph').classList.contains('shaded'),false);
  assert.deepEqual(rel('a'),[]);
  assert.match(legend().textContent,/inconsistent with the background/);

  // Escape clears the focus and the legend; Escape in the search box does not.
  w.select({type:'principle',id:'a'});
  d.getElementById('graph-search').dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
  assert.equal(w.eval('state.focus'),'a','Escape in the search box keeps the focus');
  d.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
  assert.equal(w.eval('state.focus'),null);
  assert.equal(legend().hidden,true);
  assert.deepEqual(rel('b'),[]);

  // Hollow arrowheads: G ⇒ A has a model-refuted converse, H ⇒ A an open one.
  const marker=key=>d.querySelector(`[data-edge="${key}"] .edge`).getAttribute('marker-end');
  assert.ok(!marker('ga').includes('-open'));
  assert.ok(marker('ha').includes('-open'));
  assert.match(d.querySelector('[data-edge="ha"] title').textContent,/Converse open/);
  assert.match(d.querySelector('[data-edge="ga"] title').textContent,/Converse refuted/);
  assert.ok(!marker('zf').includes('-open'),'Arrows into ⊥ keep a filled head');

  // Witnesses outside the selected sources are reported as such, never silently as open.
  d.querySelector('[data-source-filter="submission"]').click();
  w.select({type:'principle',id:'a'});
  w.select({type:'principle',id:'d'},true);
  assert.match(pop().textContent,/A ⇒ D[\s\S]*refuted by a model[\s\S]*outside the selected sources/);
  d.querySelector('[data-source-filter="submission"]').click();

  // A negative literal compares through the same machinery.
  w.eval("state.negativeShown.add('d');refreshPrincipleControls();renderAll(true)");
  w.select({type:'principle',id:'a'});
  assert.deepEqual(rel('!d'),['rel-separated'],'M2 satisfies A and D, refuting A ⇒ ¬D');
  w.select({type:'principle',id:'!d'},true);
  assert.match(pop().textContent,/A ∧ ¬D[\s\S]*consistent/,'M1 witnesses A ∧ ¬D');

  // The relation query never uses conjectures as proofs.
  const conjectural={...fixture,results:[...fixture.results,rule('ae',['a'],'e','conjectured')]};
  const dom2=page(conjectural),w2=dom2.window,d2=dom2.window.document;
  w2.select({type:'principle',id:'a'});
  const node2=id=>[...d2.querySelectorAll('#graph .node')].find(n=>(n.dataset.members||'').split(',').includes(id));
  assert.ok(node2('e').classList.contains('rel-open'));
  d2.getElementById('show-conj').click();
  w2.select({type:'principle',id:'a'});
  assert.ok(node2('e').classList.contains('rel-conjectured'),'With conjecture arrows shown the relation is marked as conjectured, not proved');
  assert.match(d2.getElementById('relation-legend').textContent,/conjectured 1/);

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: relation shading with glyphs and counts, focus surviving arrow popups and hover, converse and premise-necessity readouts, Shift-click and armed comparison, no explosion, Escape, hollow heads, filtered witnesses, negatives, and conjecture discipline.');
}finally{pages.forEach(p=>p.window.close());}

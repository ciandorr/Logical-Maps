// NODE_PATH=/path/to/node_modules node scripts/check_relations_ui.cjs
// Non-implications on the graph: clicking a principle shades every other
// principle by its relation (entailed, excluded, consistent, negation consistent, independent, open),
// Shift-click extends the selection, arrow details report the converse and
// premise necessity, and every arrowhead is filled. Nothing here may assert
// more than the engine knows.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
function page(data,url='https://maps.example/'){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);dom.window.eval('state.excluded.clear(); repaintGraph();');return dom;}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture',checked_by:[]});
const rule=(id,premises,conclusion,status='proved',source='paper')=>({id,premises,conclusion,status,certificate:cert(source),sources:['Fixture'],source_names:['Fixture']});
const model=(id,satisfies,violates,source='submission',status='proved')=>({id,name:'Model '+id.toUpperCase(),status,satisfies,violates,certificate:cert(source),sources:['Fixture'],source_names:['Fixture']});
const topic={id:'relations',title:'Relations fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'},{id:'submission',name:'Submission',kind:'online-submission'}]};
const ids=['a','b','c','d','e','f','g','h','i','z'];
const fixture={topic,principles:ids.map(id=>({id,name:id.toUpperCase(),statement:'Principle '+id})),
  results:[rule('ab',['a'],'b'),rule('acf',['a','c'],false),rule('ga',['g'],'a'),rule('ha',['h'],'a'),rule('zf',['z'],false),rule('bd',['b','f'],'d')],
  models:[model('m1',['a'],['d']),model('m2',['a','d','i'],[]),model('m3',['a'],['g'])]};
const dom=page(fixture),w=dom.window,d=w.document;
const node=id=>[...d.querySelectorAll('#graph .node')].find(n=>(n.dataset.members||'').split(',').includes(id));
const rel=id=>[...node(id).classList].filter(c=>c.startsWith('rel-'));
const legend=()=>d.getElementById('relation-legend');
const pop=()=>d.getElementById('pop');
function fixedKeys(doc) {
  const keys=[...doc.querySelectorAll('#relation-legend .key')];
  assert.deepEqual(keys.map(k=>k.classList[1]),['entailed','excluded','consistent','separated'],'The legend keeps exactly four keys in the same order');
  assert.deepEqual(keys.map(k=>[...k.childNodes].filter(n=>n.nodeType===3).map(n=>n.textContent).join('').trim()),['entailed','excluded','consistent','negation is consistent']);
}
try{
  const normalFill=w.getComputedStyle(node('e').querySelector('rect')).fill;
  // Shading relative to A.
  w.select({type:'principle',id:'a'});
  assert.equal(w.eval('state.focus'),'a');
  assert.ok(d.getElementById('graph').classList.contains('shaded'));
  assert.deepEqual(rel('a'),['rel-base']);
  assert.deepEqual(rel('b'),['rel-entailed'],'A ⇒ B');
  assert.deepEqual(rel('c'),['rel-excluded'],'A ∧ C ⇒ ⊥');
  assert.deepEqual(rel('d'),['rel-independent'],'M1 witnesses A ∧ ¬D and M2 witnesses A ∧ D');
  assert.deepEqual(rel('e'),['rel-open']);
  assert.deepEqual(rel('f'),['rel-separated'],'Adjoining F to M1 would force D, which M1 violates');
  assert.deepEqual(rel('g'),['rel-separated'],'M3 satisfies A and violates G');
  assert.deepEqual(rel('h'),['rel-open']);
  assert.deepEqual(rel('i'),['rel-consistent'],'M2 witnesses A ∧ I; no model decides A ∧ ¬I');
  const fill=id=>w.getComputedStyle(node(id).querySelector('rect')).fill.replaceAll('"','');
  assert.equal(fill('e'),normalFill,'Open retains the unselected fill');
  assert.notEqual(fill('b'),normalFill,'Entailed has a distinct fill');
  assert.equal(fill('i'),'url(#split-consistent)');
  assert.equal(fill('f'),'url(#split-separated)');
  assert.equal(fill('d'),'url(#split-independent)');
  for(const kind of ['consistent','separated','independent']) assert.ok(d.querySelector(`#split-${kind}`));
  assert.deepEqual(rel('z'),['rel-excluded'],'False and its background-equivalent principles are excluded by A');
  assert.equal(d.querySelector('.rel-mark'),null,'Relation colours do not have redundant corner glyphs');
  assert.equal(node('z').querySelector('title').textContent,'Excluded by selection');
  assert.equal(node('d').querySelector('title').textContent,'Independent of selection');
  assert.equal(legend().hidden,false);
  assert.match(legend().textContent,/Relative to A:/);
  fixedKeys(d);
  for(const key of ['entailed 1','excluded 2','consistent 2','negation is consistent 4']) assert.ok(legend().textContent.includes(key),`legend shows ${key}: ${legend().textContent}`);
  assert.equal(d.querySelector('[data-compare-arm]'),null);
  assert.ok([...legend().querySelectorAll('.key i')].every(i=>!i.textContent),'Legend swatches use colour alone');

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

  // Shift-click selects the joint conjunction and links its consistency evidence.
  w.select({type:'principle',id:'a'});
  assert.equal(w.eval("expressionStatus('a','d').status"),'independent');
  assert.equal(w.eval("expressionStatus('d','a').status"),'open');
  w.handleGraphClick(node('d').querySelector('rect'),true);
  assert.equal(w.eval('state.selected.type'),'selection');
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(state.focus)')),['a','d']);
  assert.match(pop().textContent,/A ∧ D[\s\S]*Joint consistency[\s\S]*consistent/);
  assert.ok(pop().querySelector('button[data-model="m2"]'),'The joint witness is linked');
  assert.ok(node('a').classList.contains('selected')&&node('d').classList.contains('selected'));
  assert.deepEqual(rel('b'),['rel-entailed'],'The whole conjunction implies B');
  // A regular click replaces the selection; sidebar modifiers add to it.
  d.querySelector('#pr-filters button[data-principle="b"]').click();
  assert.equal(w.eval('state.focus'),'b');
  d.querySelector('#pr-filters button[data-principle="a"]').dispatchEvent(new w.MouseEvent('click',{bubbles:true,shiftKey:true}));
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(state.focus)')),['b','a']);
  assert.equal(w.eval("selectionRelation('a','f').kind"),'separated','One countermodel does not establish independence');

  // An inconsistent focus marks every box as excluded without changing proofs.
  w.select({type:'principle',id:'z'});
  assert.ok(d.getElementById('graph').classList.contains('inconsistent-selection'));
  for(const n of d.querySelectorAll('#nodes .node')) assert.ok(n.classList.contains('rel-excluded'));
  assert.equal(legend().querySelector('.excluded .n').textContent,String(d.querySelectorAll('#nodes .node, #nodes .junction:not([data-parent])').length));
  assert.equal(w.eval("expressionStatus('z','a').status"),'inconsistent','The red display does not fabricate implication proofs');
  assert.match(legend().textContent,/inconsistent with the background/);
  fixedKeys(d);

  // Escape clears the focus and the legend; Escape in the search box does not.
  w.select({type:'principle',id:'a'});
  assert.ok(!d.getElementById('graph').classList.contains('inconsistent-selection'));
  d.getElementById('graph-search').dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
  assert.equal(w.eval('state.focus'),'a','Escape in the search box keeps the focus');
  d.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
  assert.equal(w.eval('state.focus'),null);
  assert.equal(legend().hidden,true);
  assert.deepEqual(rel('b'),[]);

  // Open and refuted converses use the same filled arrowhead.
  const marker=key=>d.querySelector(`[data-edge="${key}"] .edge`).getAttribute('marker-end');
  assert.equal(marker('ga'),marker('ha'));
  assert.ok(!marker('ha').includes('-open'));
  // The guard is about the implication graph, which uses one filled head for
  // every arrow. The lattice view is a different diagram with a convention of
  // its own, so the query is scoped rather than document wide, and paired with
  // a direct check that no arrow on the graph reaches for a hollow head.
  assert.equal(d.querySelector('#graph marker[id$="-open"]'),null);
  assert.ok([...d.querySelectorAll('#graph .edge')].every(e=>!(e.getAttribute('marker-end')||'').includes('-open')),'No graph arrow uses a hollow head');
  assert.doesNotMatch(d.querySelector('[data-edge="ha"] title').textContent,/Converse/);
  assert.doesNotMatch(d.querySelector('[data-edge="ga"] title').textContent,/Converse/);
  assert.ok(node('z').classList.contains('falsity'),'Z belongs to the False equivalence box');
  assert.equal(d.querySelector('[data-edge="zf"]'),null,'No arrow is drawn inside an equivalence box');

  // Witnesses outside the selected sources are reported as such, never silently as open.
  d.querySelector('[data-source-filter="submission"]').click();
  w.select({type:'principle',id:'a'});
  assert.deepEqual(rel('d'),['rel-independent']);
  assert.equal(node('d').querySelector('title').textContent,'Independent of selection (outside selected sources)');
  w.select({type:'principle',id:'a'});
  assert.equal(w.eval("expressionStatus('a','d').limited"),true);
  w.select({type:'principle',id:'d'},true);
  assert.match(pop().textContent,/Joint consistency[\s\S]*consistent[\s\S]*outside the selected sources/);
  d.querySelector('[data-source-filter="submission"]').click();

  // Negative literals can join the selection.
  w.eval("state.negativeShown.add('d');refreshPrincipleControls();renderAll(true)");
  w.select({type:'principle',id:'a'});
  assert.deepEqual(rel('!d'),['rel-independent'],'M1 and M2 witness both values of ¬D with A');
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
  fixedKeys(d2);

  // Conjectured models cannot establish either kind of consistency witness.
  const dom3=page({...fixture,models:[...fixture.models,model('guess',['a','e'],[],'submission','conjectured')]});
  dom3.window.document.getElementById('show-conj').click();
  dom3.window.select({type:'principle',id:'a'});
  const e3=[...dom3.window.document.querySelectorAll('#nodes .node')].find(n=>n.dataset.members.split(',').includes('e'));
  assert.ok(e3.classList.contains('rel-open'));
  // Models must satisfy the full selected conjunction, not only one premise.
  assert.equal(w.eval("selectionRelation(['a','e'],'d').kind"),'open');
  // Empty categories remain visible, including when nothing is excluded.
  const empty=page({...fixture,results:[],models:[]}).window;
  for(const id of ['a','b']) {
    empty.select({type:'principle',id});
    fixedKeys(empty.document);
    assert.deepEqual([...empty.document.querySelectorAll('#relation-legend .n')].map(n=>n.textContent),['0','0','0','0']);
  }
  empty.document.getElementById('trivial-arrows').click();
  fixedKeys(empty.document);
  assert.ok(empty.document.querySelector('#nodes [data-falsity]').classList.contains('rel-excluded'),'A standalone False constant is excluded too');
  assert.equal(empty.document.querySelector('#relation-legend .excluded .n').textContent,'1');
  // The legend reports whether the selection itself can hold with the
  // background, and the selected box is dashed only when nothing settles it.
  const cons=page(fixture).window, cd=cons.document;
  const status=()=>{const st=cd.querySelector('#relation-legend .rel-status');
    return {kind:st&&[...st.classList].filter(c=>c!=='rel-status')[0], text:st&&st.textContent,
      dashed:cd.getElementById('graph').classList.contains('unwitnessed-selection')};};
  cons.select({type:'principle',id:'a'});
  let st=status();
  assert.equal(st.kind,'implies','A witnessed selection is reported as consistent');
  assert.match(st.text,/Consistent with the background \(Model M/);
  assert.equal(st.dashed,false);
  cons.select({type:'principle',id:'e'});
  st=status();
  assert.equal(st.kind,'open','An unwitnessed selection says so');
  assert.match(st.text,/Not shown consistent/);
  assert.equal(st.dashed,true,'Only an unsettled selection dashes its box');
  assert.match([...cd.querySelectorAll('#nodes .node.rel-base title')][0].textContent,/Not shown consistent/,'The selected box repeats it on hover');
  cons.select({type:'principle',id:'z'});
  st=status();
  assert.equal(st.kind,'inconsistent','A refuted selection keeps its own message');
  assert.equal(st.dashed,false,'An inconsistent selection is not merely unsettled');
  // Hiding the only witness downgrades the verdict without losing it.
  cons.select({type:'principle',id:'a'});
  cd.querySelector('[data-source-filter="submission"]').click();
  st=status();
  assert.equal(st.kind,'implies');
  assert.match(st.text,/outside selected sources/,'A witness behind a source filter is named as such');
  assert.equal(st.dashed,false);
  fixedKeys(cd);

  // The reported real-map selection keeps the same legend and False shading.
  const real=page(JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'))).window;
  real.addBackgroundPreset('dtu');
  real.select({type:'principle',id:'folded-expectation'});
  fixedKeys(real.document);
  assert.match(real.document.getElementById('relation-legend').textContent,/Relative to Folded Expectation:/);
  assert.ok(real.document.querySelector('#nodes [data-falsity]').classList.contains('rel-excluded'));
  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: fixed four-key legend, False excluded, inconsistent selections exclude every box, unchanged proof status, consistency counts, multiselection, filled arrowheads, filtered witnesses, and Folded Expectation.');
}finally{pages.forEach(p=>p.window.close());}

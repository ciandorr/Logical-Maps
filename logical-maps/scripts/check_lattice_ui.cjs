// NODE_PATH=/path/to/node_modules node scripts/check_lattice_ui.cjs
// The lattice view: a Hasse diagram of the meets that the chosen principles
// generate. It opens with the two constants, adds one principle at a time,
// gives every meet a node of its own without nesting, names a meet after a
// principle it is known equivalent to, folds an inconsistent meet into the
// floor, and draws a cover whose converse is still open differently from one
// that a model has ruled out.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture',checked_by:[]});
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert('paper'),sources:['Fixture'],source_names:['Fixture']});
const model=(id,satisfies,violates)=>({id,name:'Model '+id.toUpperCase(),status:'proved',satisfies,violates,certificate:cert('paper'),sources:['Fixture'],source_names:['Fixture']});
// A ∧ B is exactly C. D is incompatible with A. E is unrelated, and no model
// separates it from A, so that cover's converse stays open. F is equivalent to
// E, so the two share a node.
const fixture={topic:{id:'lat',title:'Lattice fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles:['a','b','c','d','e','f'].map(id=>({id,name:id.toUpperCase(),statement:'Statement of '+id.toUpperCase()})),
  results:[rule('abc',['a','b'],'c'),rule('ca',['c'],'a'),rule('cb',['c'],'b'),rule('adf',['a','d'],false),rule('ea',['e'],'a'),rule('ef',['e'],'f'),rule('fe',['f'],'e')],
  models:[model('m1',['a'],['b','c','e']),model('m2',['b'],['a','c']),model('m3',['d'],['a','c'])]};
const pages=[],errors=[];
function page(data=fixture){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url:'https://maps.example/?assume=',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
  pages.push(dom);return dom;}
try{
  const dom=page(),w=dom.window,d=w.document;
  d.querySelector('.tab[data-tab="lattice"]').click();
  const pane=d.getElementById('pane-lattice'), graphPane=d.getElementById('pane-graph');
  const shown=el=>w.getComputedStyle(el).display!=='none';
  assert.equal(pane.dataset.active,'true','The lattice has its own pane');
  // Visibility, not just the flag: a pane rule that outranks the one hiding an
  // inactive pane leaves this view on screen over every other tab.
  assert.ok(shown(pane),'The lattice pane is visible when its tab is chosen');
  assert.ok(!shown(graphPane),'And the graph pane is not');
  d.querySelector('.tab[data-tab="graph"]').click();
  assert.ok(!shown(pane),'Leaving the tab hides the lattice pane');
  assert.ok(shown(graphPane),'And brings the graph back');
  for (const t of ['models','results','background','open']) {
    d.querySelector(`.tab[data-tab="${t}"]`).click();
    assert.ok(!shown(pane),`The lattice pane stays hidden on the ${t} tab`);
  }
  d.querySelector('.tab[data-tab="lattice"]').click();
  const snap=()=>JSON.parse(w.eval('JSON.stringify({n:lattice.nodes.length,e:lattice.edges.length,labels:lattice.nodes.map(x=>x.label),open:lattice.edges.filter(x=>x.reverses==="open").length})'));
  const add=id=>{w.eval(`latticeToggle(${JSON.stringify(id)})`);return snap();};

  // It opens with the two constants and nothing else.
  let s=snap();
  assert.deepEqual(s.labels.slice().sort(),['⊤','⊥'],'The empty lattice is just the two constants');

  // Each principle joins as its own node. Their meet is nobody's choice yet, so
  // it is an ∧ rather than a label, and the map's own name for it stays in the
  // readout. Only what the reader chose puts a name on the diagram.
  const names=()=>JSON.parse(w.eval('JSON.stringify(lattice.nodes.map(n=>n.names))'));
  const meets=()=>JSON.parse(w.eval('JSON.stringify(lattice.nodes.filter(n=>n.meet).map(n=>({gen:n.generators,mapName:n.mapName})))'));
  add('a'); s=add('b');
  assert.ok(names().some(v=>v.join()==='A')&&names().some(v=>v.join()==='B'),'Both chosen principles appear under their names');
  assert.ok(!names().flat().includes('C'),'A principle nobody chose does not put its name on the diagram');
  assert.equal(s.n,5,'Two principles, their meet and the two constants');
  const meet=meets();
  assert.equal(meet.length,1,'The meet is drawn as an ∧');
  assert.deepEqual(meet[0].gen.slice().sort(),['a','b'],'It is the meet of the two chosen principles');
  assert.equal(meet[0].mapName,'c','And the readout keeps the map\'s name for it');
  assert.equal(d.querySelectorAll('#lat-graph .lat-meet circle').length,1,'An ∧ is a circle');
  assert.equal([...d.querySelectorAll('#lat-graph .lat-meet text')].map(t=>t.textContent).join(''),'∧','With the glyph inside');

  // Choosing that principle turns the ∧ into an ordinary box under its name.
  add('c');
  assert.equal(d.querySelectorAll('#lat-graph .lat-meet circle').length,0,'No ∧ is left');
  assert.ok(names().some(v=>v.join()==='C'),'The meet is now a box named C');
  assert.equal(snap().n,5,'And it is the same node, not a new one');
  w.eval("latticeToggle('c')");

  // A box with one name centres it, rather than reserving room for a header
  // it does not have, and an ∧ is the size of the graph's own.
  const box=label=>[...d.querySelectorAll('#lat-graph .lat-node')].find(g=>[...g.querySelectorAll('text')].map(t=>t.textContent).join()===label);
  const single=box('A'), rect=single.querySelector('rect'), text=single.querySelector('text');
  assert.ok(Math.abs(+text.getAttribute('y')-(+rect.getAttribute('y')+ +rect.getAttribute('height')/2))<0.01,
    'A single name sits at the centre of its box');
  assert.equal(+rect.getAttribute('height'),33,"And the box uses the graph's own padding");

  // Nothing nests: every node is its own box in the diagram.
  s=snap();
  assert.equal(d.querySelectorAll('#lat-graph [data-lat-node]').length,s.n,'Every node is drawn separately');
  assert.equal(d.querySelectorAll('#lat-graph [data-lat-node] [data-lat-node]').length,0,'No node is nested inside another');

  // The constants keep their own names, and take in anything equivalent to
  // them that the reader chose.
  assert.ok(names().some(v=>v.join()==='⊤'),'True names its own node');
  assert.ok(names().some(v=>v.join()==='⊥'),'And so does False');
  assert.ok(!names().flat().some(t=>t!=='⊤'&&t!=='⊥'&&!['A','B'].includes(t)),'Nothing unchosen is named anywhere');

  // An incompatible partner folds into the floor rather than adding a node.
  const before=snap().n;
  s=add('d');
  assert.equal(s.labels.filter(l=>l==='⊥').length,1,'The floor stays a single node');
  assert.ok(s.n>before,'D itself is added');
  assert.ok(!meets().some(m=>m.gen.includes('a')&&m.gen.includes('d')),'Its inconsistent meet with A is the floor, not a node of its own');
  w.eval("latticeToggle('d')");

  // Covers are marked by whether the converse is settled.
  s=add('e');
  assert.ok(s.open>0,'Some cover has an open converse');
  const dashed=[...d.querySelectorAll('#lat-graph .lat-edge.may-reverse')];
  const solid=[...d.querySelectorAll('#lat-graph .lat-edge:not(.may-reverse)')];
  assert.equal(dashed.length,s.open,'Every open cover is drawn as such');
  assert.ok(solid.length,'And settled covers are drawn differently');
  assert.ok(dashed.every(p=>p.getAttribute('marker-end').includes('lat-open')),'An open cover carries the hollow head');
  assert.ok(solid.every(p=>!p.getAttribute('marker-end').includes('lat-open')),'A settled cover carries the filled head');
  assert.notEqual(w.getComputedStyle(dashed[0]).strokeDasharray,w.getComputedStyle(solid[0]).strokeDasharray,'The two read differently at a glance');

  // Clicking reports the reading; clearing returns to the constants.
  dashed[0].closest('[data-lat-edge]').dispatchEvent(new w.MouseEvent('click',{bubbles:true}));
  assert.match(d.getElementById('lat-detail').textContent,/converse is open/,'An open cover explains itself');
  d.querySelector('#lat-graph [data-lat-node]').dispatchEvent(new w.MouseEvent('click',{bubbles:true}));
  assert.ok(d.getElementById('lat-detail').textContent.trim().length,'A node reports something too');
  d.getElementById('lat-clear').click();
  assert.deepEqual(snap().labels.slice().sort(),['⊤','⊥'],'Clearing returns to the two constants');

  // The sidebar has no control for adding many at once, but does offer the
  // same per-principle choices as the graph: positive, negative, background.
  assert.equal(d.querySelectorAll('#lat-filters [data-category-select]').length,0,'No bulk controls');
  assert.equal(d.querySelectorAll('#lat-filters .lat-row').length,fixture.principles.length,'It lists every principle');
  const row=id=>d.querySelector(`#lat-filters [data-lat-row="${id}"]`);
  const snapshot=()=>JSON.parse(w.eval('JSON.stringify({shown:lattice.shown,labels:lattice.nodes.map(x=>x.label)})'));

  // A negation joins as a generator in its own right and is labelled as one.
  w.eval('lattice.shown=[];renderLattice();');
  row('a').querySelector('[data-lat-positive]').click();
  row('b').querySelector('[data-lat-negative]').click();
  let g=snapshot();
  assert.deepEqual(g.shown,['a','!b'],'A negation is a generator like any other');
  assert.ok(names().some(v=>v.join()==='¬B'),'And is drawn under its negated name');
  assert.ok(meets().some(m=>m.gen.slice().sort().join()==='!b,a'),'Its meet with A is an ∧');
  assert.equal(row('a').querySelector('[data-lat-positive]').getAttribute('aria-pressed'),'true');
  assert.equal(row('b').querySelector('[data-lat-negative]').getAttribute('aria-pressed'),'true');

  // A principle together with its own negation is the floor.
  w.eval('lattice.shown=[];renderLattice();');
  row('a').querySelector('[data-lat-positive]').click();
  row('a').querySelector('[data-lat-negative]').click();
  g=snapshot();
  assert.equal(g.labels.filter(l=>l==='⊥').length,1,'A principle and its negation meet at the floor');
  assert.equal(g.labels.length,4,'And add nothing else');

  // The background is shared with the graph, and the dock follows the view.
  assert.equal(d.getElementById('background-dock').closest('.pane').id,'pane-lattice','The dock comes across with the sidebar');
  w.eval('lattice.shown=[];renderLattice();');
  row('a').querySelector('[data-lat-positive]').click();
  row('a').querySelector('[data-lat-background]').click();
  assert.deepEqual(snapshot().shown,[],'An assumption stops being a generator');
  assert.ok(row('a').classList.contains('in-background'),'Its row says so');
  assert.ok(w.eval('[...background].includes("a")'),'And it reaches the shared background');
  d.querySelector('.tab[data-tab="graph"]').click();
  assert.equal(d.getElementById('background-dock').closest('.pane').id,'pane-graph','The dock goes back with the graph');
  assert.ok(d.querySelector('#pr-filters [data-pr-row="a"]').classList.contains('in-background'),'The graph sidebar agrees');
  d.querySelector('.tab[data-tab="lattice"]').click();
  w.eval('changeBackground("a",false);');

  // The workspace is a grid, so its rows have to match its children. Getting
  // that wrong once put the detail pane in the divider's nine pixels, where
  // nothing it held could be seen.
  const workspace=d.querySelector('#pane-lattice .graph-workspace');
  const declared=w.getComputedStyle(workspace).gridTemplateRows.split(/\s+(?![^(]*\))/).filter(Boolean);
  assert.equal(declared.length,workspace.children.length,'The workspace declares one row per child');
  assert.equal(w.getComputedStyle(d.getElementById('lat-graph')).gridRow,
    w.getComputedStyle(d.getElementById('graph')).gridRow,'The diagram sits in the same row as the graph does');

  // Clicking reuses the graph's own selection, so a principle, an ∧ and an
  // arrow read the same way here as they do there.
  w.eval('lattice.shown=[];renderLattice();');
  add('a'); add('b');
  const pop=d.getElementById('pop'), click=el=>el.dispatchEvent(new w.MouseEvent('click',{bubbles:true}));
  assert.equal(pop.parentElement.id,'lat-detail','The shared popup docks in the lattice');

  // A principle name: its own name, its statement, and the graph's shading.
  click(d.querySelector('#lat-graph text[data-principle="a"]'));
  assert.equal(pop.hidden,false);
  assert.equal(d.querySelector('#pop .pop-t').textContent,'A','The popup names the principle');
  assert.match(pop.textContent,/Statement of A/,'And gives its statement');
  const shaded=[...d.querySelectorAll('#lat-graph .lat-node')].map(g=>[...g.classList].find(c=>c.startsWith('rel-'))).filter(Boolean);
  assert.equal(shaded.length,snap().n,'Every node takes a relation class');
  assert.ok(shaded.includes('rel-base'),'The selection marks itself');
  assert.ok(shaded.some(c=>c==='rel-entailed'||c==='rel-excluded'||c==='rel-consistent'||c==='rel-separated'||c==='rel-independent'),
    'And the others take the graph\'s own kinds');
  assert.equal(d.getElementById('lat-legend').hidden,false,'A legend explains them');
  assert.match(d.getElementById('lat-legend').textContent,/Relative to A:/);
  // The constants take the graph's reading: the ceiling follows from anything,
  // the floor is ruled out by any consistent selection.
  const rel=sel=>[...d.querySelector(sel).classList].find(c=>c.startsWith('rel-'));
  assert.equal(rel('#lat-graph .lat-top'),'rel-entailed','True is entailed by the selection');
  assert.equal(rel('#lat-graph .lat-bottom'),'rel-excluded','False is excluded by it');
  // The class is not enough: a later rule that paints the constants in the
  // selection colour would still show the floor as if it followed.
  add('d');
  const fill=sel=>w.getComputedStyle(d.querySelector(sel+' rect')).fill;
  assert.equal(rel('#lat-graph .lat-node[data-lat-node="lat:d"]'),'rel-excluded','D is excluded by A');
  assert.equal(fill('#lat-graph .lat-bottom'),fill('#lat-graph .lat-node[data-lat-node="lat:d"]'),'And the floor is painted as D is');
  assert.notEqual(fill('#lat-graph .lat-bottom'),fill('#lat-graph .lat-top'),'Not as the ceiling is');
  assert.notEqual(fill('#lat-graph .lat-bottom'),fill('#lat-graph .rel-base'),'Nor as the selection is');
  w.eval('latticeToggle("d")');
  // The selected name is marked as it is on the graph, and only that name.
  const marked=()=>[...d.querySelectorAll('#lat-graph text.selection-member')].map(t=>t.textContent);
  assert.deepEqual(marked(),['A'],'The selected name is marked on the diagram');
  const markedStyle=w.getComputedStyle(d.querySelector('#lat-graph text.selection-member'));
  assert.equal(markedStyle.fontWeight,'700','In bold');
  assert.match(markedStyle.textDecoration,/underline/,'And underlined');

  // Two names on one node select the same node whichever is clicked; only
  // the mark moves.
  add('e'); add('f');
  const shared=[...d.querySelectorAll('#lat-graph .lat-node')].find(g=>g.querySelector('text[data-principle="e"]'));
  assert.ok(shared.querySelector('text[data-principle="f"]'),'E and F share a node');
  click(shared.querySelector('text[data-principle="e"]'));
  const sharedNow=()=>[...d.querySelectorAll('#lat-graph .lat-node')].find(g=>g.querySelector('text[data-principle="e"]'));
  assert.ok(sharedNow().classList.contains('rel-base'),'Clicking E selects the node');
  assert.deepEqual(marked(),['E']);
  click(sharedNow().querySelector('text[data-principle="f"]'));
  assert.ok(sharedNow().classList.contains('rel-base'),'Clicking F selects the same node, not a node entailed by F');
  assert.deepEqual(marked(),['F'],'And the mark moves to F');
  assert.equal(d.querySelector('#pop .pop-t').textContent,'F','While the popup follows the click');
  w.eval('lattice.shown=["a","b"];renderLattice();');
  click(d.querySelector('#lat-graph text[data-principle="a"]'));

  // An ∧: the conjunction, with each conjunct and its statement.
  click(d.querySelector('#lat-graph .lat-meet'));
  assert.equal(d.querySelector('#pop .pop-t').textContent,'A ∧ B','The ∧ names its conjunction');
  assert.match(pop.textContent,/Statement of A/);
  assert.match(pop.textContent,/Statement of B/);

  // An arrow: where it comes from, and what rules the converse out.
  const settled=[...d.querySelectorAll('#lat-graph .lat-edge:not(.may-reverse)')][0];
  click(settled.closest('[data-lat-edge]'));
  assert.match(pop.textContent,/⇒/,'The arrow states its implication');
  assert.match(pop.textContent,/Why/,'It says where it comes from');
  assert.match(pop.textContent,/Converse/,'And reports the converse');
  assert.ok(pop.querySelectorAll('[data-model]').length||/contradiction|background already gives/.test(pop.textContent),
    'A settled arrow names the model that rules its converse out, unless it is one of the constants');
  assert.doesNotMatch(pop.textContent,/might yet/,'A settled arrow does not hedge');
  const openArrow=[...d.querySelectorAll('#lat-graph .lat-edge.may-reverse')][0];
  assert.ok(openArrow,'The fixture has an arrow whose converse is open');
  click(openArrow.closest('[data-lat-edge]'));
  // Two wordings, since an open arrow out of the floor is asking whether the
  // node above it is the contradiction rather than whether two nodes merge.
  assert.match(pop.textContent,/might yet (collapse into one node|be the contradiction)/,'An open arrow says the two might still be one');
  assert.equal(d.querySelectorAll('#lat-graph .lat-edge-g.sel').length,1,'A selected arrow is marked on the diagram');
  w.eval('select(null)');

  // The arrow-source selector is the graph's own, moved into the lattice
  // sidebar, and the lattice is drawn from the selected sources alone: a
  // proof from a deselected source no longer orders two nodes, and a model
  // from one no longer settles a converse.
  const withNotes={...fixture,
    topic:{...fixture.topic,source_catalog:[...fixture.topic.source_catalog,{id:'notes',name:'Notes',kind:'misc'}]},
    principles:[...fixture.principles,{id:'g',name:'G',statement:'Statement of G'},{id:'h',name:'H',statement:'Statement of H'}],
    results:[...fixture.results,{...rule('ga',['g'],'a'),certificate:cert('notes')}],
    models:[...fixture.models,{...model('m4',['b'],['h']),certificate:cert('notes')}]};
  const dom2=page(withNotes),w2=dom2.window,d2=w2.document;
  const sources=d2.getElementById('source-controls');
  assert.equal(sources.closest('.pane').id,'pane-graph','The selector starts in the graph pane');
  d2.querySelector('.tab[data-tab="lattice"]').click();
  assert.equal(sources.closest('.pane').id,'pane-lattice','And comes across to the lattice with that tab');
  assert.ok([...d2.querySelectorAll('#pane-lattice [data-source-filter]')].every(cb=>cb.checked),'Every source starts selected');
  assert.ok(d2.querySelector('#pane-lattice [data-source-filter="notes"]'),'The new source is offered');
  // G ⇒ A comes only from the notes; so does the model with B but not H,
  // and H is otherwise untouched, so nothing else can settle B ⇒ H.
  const shape=shown=>JSON.parse(w2.eval(`lattice.shown=${JSON.stringify(shown)};renderLattice();JSON.stringify({meets:lattice.nodes.filter(n=>n.meet).length,edges:Object.fromEntries(lattice.edges.map(x=>[x.id,x.reverses]))})`));
  assert.equal(shape(['a','g']).meets,0,'With every source, G sits below A and there is no meet to draw');
  assert.equal(shape(['b','h']).edges['lat:b|h>lat:b'],'ruled out','And a model settles the converse of B ∧ H ⇒ B');
  const notes=d2.querySelector('#pane-lattice [data-source-filter="notes"]');
  notes.checked=false; notes.dispatchEvent(new w2.Event('change',{bubbles:true}));
  assert.equal(shape(['a','g']).meets,1,'Without the notes, A ∧ G is a meet of its own');
  assert.equal(shape(['b','h']).edges['lat:b|h>lat:b'],'open','And the converse of B ∧ H ⇒ B is open again');
  const beEdge=d2.querySelector('#lat-graph [data-lat-edge="lat:b|h>lat:b"] .lat-edge');
  assert.ok(beEdge.classList.contains('may-reverse'),'The arrow is drawn as such');
  beEdge.closest('[data-lat-edge]').dispatchEvent(new w2.MouseEvent('click',{bubbles:true}));
  assert.match(d2.getElementById('pop').textContent,/outside the selected sources/,'The readout still names the hidden model, marked as outside the selection');
  d2.querySelector('.tab[data-tab="graph"]').click();
  assert.equal(sources.closest('.pane').id,'pane-graph','The selector goes back with the graph');
  assert.equal(sources.nextElementSibling.id,'graph-options','In its old place');

  // The sidebar itself is the graph's, so the lattice pane is laid out as the
  // graph pane is: sidebar, divider, workspace, one column each; and each
  // view shows its own blocks in the one scrolling list.
  const columns=el=>w2.getComputedStyle(el).gridTemplateColumns.split(/\s+(?![^(]*\))/).filter(Boolean).length;
  const visible=id=>w2.getComputedStyle(d2.getElementById(id)).display!=='none';
  const graphColumns=columns(d2.getElementById('pane-graph'));
  d2.querySelector('.tab[data-tab="lattice"]').click();
  const latPane=d2.getElementById('pane-lattice');
  assert.equal(latPane.children.length,3,'Sidebar, divider and workspace');
  assert.equal(columns(latPane),3,'With a column declared for each');
  assert.equal(columns(latPane),graphColumns,'As on the graph pane');
  assert.equal(d2.getElementById('graph-sidebar').closest('.pane'),latPane,'The scrolling list is the graph\'s own element');
  assert.ok(visible('lat-controls')&&visible('lat-principles'),'The lattice shows its own blocks');
  assert.ok(!visible('graph-options')&&!visible('graph-principles'),'And not the graph\'s');
  d2.querySelector('.tab[data-tab="graph"]').click();
  assert.ok(!visible('lat-controls')&&!visible('lat-principles'),'Which are hidden again on the graph');
  assert.ok(visible('graph-options')&&visible('graph-principles'));

  // The same three moves from the lattice's details pane, acting on the
  // lattice's own choices.
  d2.querySelector('.tab[data-tab="lattice"]').click();
  w2.eval('lattice.shown=["a","b"];renderLattice();');
  const act=kind=>d2.querySelector(`#pop [data-selection-action="${kind}"]`);
  d2.querySelector('#lat-graph text[data-principle="a"]').dispatchEvent(new w2.MouseEvent('click',{bubbles:true}));
  assert.ok(act('hide')&&act('negate')&&act('background'),'A lattice principle offers the three moves');
  act('negate').click();
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),['a','b','!a'],'Adding the negation adds it as a generator');
  assert.equal(d2.querySelector('#pane-lattice [data-lat-negative="a"]').getAttribute('aria-pressed'),'true','As the sidebar shows');
  assert.ok(!act('negate'),'And the offer is withdrawn');
  act('hide').click();
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),['b','!a'],'Hiding drops the literal, and only that literal');
  assert.equal(w2.eval('state.focus'),null,'Nothing is selected any more');
  d2.querySelector('#lat-graph .lat-meet').dispatchEvent(new w2.MouseEvent('click',{bubbles:true}));
  assert.equal(act('negate').textContent,'Add negations','An ∧ offers them for its conjuncts together');
  act('background').click();
  assert.ok(w2.eval('background.has("b") && negativeBackground.has("a")'),'Moving to background assumes each conjunct with its sign');
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),[],'And they stop being generators');
  assert.ok(d2.querySelector('#pane-lattice [data-lat-row="a"]').classList.contains('in-background'),'As the sidebar shows');
  w2.eval('resetBackground()');

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: pane visibility, constants naming their own nodes, only chosen principles named, unchosen meets drawn as ∧ circles that become boxes once chosen, no nesting, inconsistent meets folded into the floor, open covers marked, negations as generators, a shared background whose dock follows the view, and clicks that reuse the graph\'s own selection for principles, conjunctions and arrows, with the floor excluded, the chosen name marked, equivalent names selecting one node, and a source selector shared with the graph that redraws the lattice from the selected sources alone, and hide / add negation / move to background offered on the selection.');
}finally{pages.forEach(p=>p.window.close());}

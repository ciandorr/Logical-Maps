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
// The diagram selects on release, and only when the pointer stayed put, so a
// pan is not a click. Drive it the way a pointer does.
function tap(win,target,extend=false){
  target.dispatchEvent(new win.MouseEvent('pointerdown',{bubbles:true,button:0,shiftKey:extend,clientX:20,clientY:20}));
  win.document.getElementById('lat-graph').dispatchEvent(new win.MouseEvent('pointerup',{bubbles:true,button:0,shiftKey:extend}));
}
function drag(win,target){
  target.dispatchEvent(new win.MouseEvent('pointerdown',{bubbles:true,button:0,clientX:20,clientY:20}));
  const svg=win.document.getElementById('lat-graph');
  svg.dispatchEvent(new win.MouseEvent('pointermove',{bubbles:true,clientX:120,clientY:70}));
  svg.dispatchEvent(new win.MouseEvent('pointerup',{bubbles:true,button:0}));
}
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
  tap(w,dashed[0].closest('[data-lat-edge]'));
  assert.match(d.getElementById('lat-detail').textContent,/converse is open/,'An open cover explains itself');
  tap(w,d.querySelector('#lat-graph [data-lat-node]'));
  assert.ok(d.getElementById('lat-detail').textContent.trim().length,'A node reports something too');
  d.getElementById('lat-clear').click();
  assert.deepEqual(snap().labels.slice().sort(),['⊤','⊥'],'Clearing returns to the two constants');

  // The sidebar offers the same per-principle choices as the graph: positive,
  // negative, background; and the same moves on a whole group.
  assert.equal(d.querySelectorAll('#lat-filters .lat-row').length,fixture.principles.length,'It lists every principle');
  const groups=[...d.querySelectorAll('#lat-filters .pr-category')];
  const bulk=()=>groups[0].querySelector('[data-lat-select]');
  assert.ok(groups.length&&groups.every(g=>g.querySelectorAll('[data-lat-select]').length===1),'Every group offers one move on itself');
  assert.equal(bulk().textContent,'show positive','With nothing chosen, that move is to show');
  bulk().click();
  const members=[...groups[0].querySelectorAll('.lat-row')].map(r=>r.dataset.latRow);
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.shown)')),members,'Show positive adds every principle of the group');
  assert.equal(groups[0].querySelector('.pr-category-count').textContent,`${members.length}/${members.length}`,'And the count says so');
  assert.equal(bulk().textContent,'hide','The move on offer is now the other one');
  bulk().click();
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.shown)')),[],'Hiding removes them again');
  assert.equal(groups[0].querySelector('.pr-category-count').textContent,`0/${members.length}`);
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

  // A choice the background already settles, together with its negation. The
  // negation cannot hold, so it is the contradiction and belongs at the floor.
  // Premises that cannot hold together entail everything, and reading them as
  // entailing nothing instead put them at the ceiling, under ⊤'s own name, so
  // two boxes claimed to be ⊤ at opposite ends of the diagram.
  w.eval('resetBackground(); setAssumption("c","positive"); lattice.shown=["a","!a"]; lattice.builtKey=null; renderLattice();');
  const settledPair=JSON.parse(w.eval('JSON.stringify(lattice.nodes.map(n=>({names:n.names,top:!!n.top,floor:!!n.inconsistent})))'));
  assert.equal(settledPair.filter(n=>n.top).length,1,'Exactly one node is the ceiling');
  assert.ok(settledPair.find(n=>n.top).names.includes('A'),'What the background settles sits there');
  const floorNode=settledPair.find(n=>n.floor);
  assert.ok(floorNode,'And the pair reaches a floor');
  assert.ok(!floorNode.top,'Which is not also the ceiling');
  assert.ok(floorNode.names.includes('¬A'),'Named by the choice that is the contradiction');
  w.eval('resetBackground(); lattice.shown=[]; lattice.builtKey=null; renderLattice();');

  // The background is shared with the graph, and the dock follows the view.
  assert.equal(d.getElementById('background-dock').closest('.pane').id,'pane-lattice','The dock comes across with the sidebar');
  w.eval('lattice.shown=[];renderLattice();');
  row('a').querySelector('[data-lat-positive]').click();
  row('a').querySelector('[data-lat-background]').click();
  assert.deepEqual(snapshot().shown,[],'An assumption stops being a generator');
  assert.ok(row('a').classList.contains('in-background'),'Its row says so');
  assert.ok(w.eval('[...background].includes("a")'),'And it reaches the shared background');
  // The decision stays visible: the assumption names the ceiling, and its
  // name there selects that node.
  const ceiling=()=>JSON.parse(w.eval('JSON.stringify(lattice.nodes.find(n=>n.top).names)'));
  assert.deepEqual(ceiling(),['⊤','A'],'The assumption joins the ceiling');
  assert.ok(d.querySelector('#lat-graph .lat-top text[data-principle="a"]'),'Under its own clickable name');
  tap(w,d.querySelector('#lat-graph .lat-top text[data-principle="a"]'));
  assert.ok(d.querySelector('#lat-graph .lat-top').classList.contains('rel-base'),'Clicking it selects the ceiling');
  w.eval('select(null)');
  w.eval('setAssumption("b","negative")');
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.nodes.find(n=>n.bottom).names)')),['⊥','B'],'A negative assumption names the floor');
  w.eval('setAssumption("b",null)');
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
  const pop=d.getElementById('pop');
  assert.equal(pop.parentElement.id,'lat-detail','The shared popup docks in the lattice');

  // A principle name: its own name, its statement, and the graph's shading.
  tap(w,d.querySelector('#lat-graph text[data-principle="a"]'));
  assert.equal(pop.hidden,false);
  assert.equal(d.querySelector('#pop .pop-t').textContent,'A','The popup names the principle');
  assert.match(pop.textContent,/Statement of A/,'And gives its statement');
  const shaded=[...d.querySelectorAll('#lat-graph .lat-node')].map(g=>[...g.classList].find(c=>c.startsWith('rel-'))).filter(Boolean);
  assert.equal(shaded.length,snap().n,'Every node takes a relation class');
  assert.ok(shaded.includes('rel-base'),'The selection marks itself');
  assert.ok(shaded.some(c=>c==='rel-entailed'||c==='rel-excluded'||c==='rel-consistent'||c==='rel-separated'||c==='rel-independent'),
    'And the others take the graph\'s own kinds');
  assert.equal(d.getElementById('lat-legend').hidden,false,'A legend explains them');
  assert.equal(d.querySelector('#lat-legend b').textContent,'A');
  assert.equal(d.querySelector('#lat-legend .rel-status'),null,'The consistency report leaves the top line');
  assert.match(d.getElementById('lat-detail-foot').textContent,/background/,'And reports from the foot instead');
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

  // Selecting a node brings forward every arrow on a path rising from it,
  // everything it entails, and fades the rest; selecting an arrow fades every
  // other arrow. Clearing restores them all.
  {
    // The ∧ of A and B rises through A and through B to ⊤, so its up-set has
    // arrows more than a step away.
    tap(w,d.querySelector('#lat-graph .lat-meet'));
    const id=d.querySelector('#lat-graph .lat-meet').dataset.latNode;
    const groups=[...d.querySelectorAll('#lat-graph [data-lat-edge]')];
    const ends=g=>g.dataset.latEdge.split('>');
    const up=new Set([id]);
    for(let grew=true;grew;){grew=false;for(const g of groups){const [from,to]=ends(g);if(up.has(from)&&!up.has(to)){up.add(to);grew=true;}}}
    const rising=g=>up.has(ends(g)[0]);
    assert.ok(groups.some(rising)&&groups.some(g=>!rising(g)),'The fixture has arrows rising from A and arrows elsewhere');
    assert.ok(groups.some(g=>rising(g)&&ends(g)[0]!==id),'Including one more than a step above it');
    assert.ok(groups.filter(rising).every(g=>g.classList.contains('near')),'Every arrow on a path up from the selected node is marked near');
    assert.ok(groups.filter(g=>!rising(g)).every(g=>g.classList.contains('far')),'And every other arrow is marked far');
    assert.ok(+w.getComputedStyle(groups.find(g=>!rising(g))).opacity<+w.getComputedStyle(groups.find(rising)).opacity,'Far arrows are fainter');
    tap(w,groups.find(rising).querySelector('.lat-hit'));
    const after=[...d.querySelectorAll('#lat-graph [data-lat-edge]')];
    assert.equal(after.filter(g=>g.classList.contains('sel')).length,1,'The clicked arrow is selected');
    assert.ok(after.filter(g=>!g.classList.contains('sel')).every(g=>g.classList.contains('far')),'And every other arrow steps back');
    w.eval('lattice.selected=null;select(null)');
    assert.ok([...d.querySelectorAll('#lat-graph [data-lat-edge]')].every(g=>!g.classList.contains('far')&&!g.classList.contains('near')),'Clearing the selection restores every arrow');
    tap(w,d.querySelector('#lat-graph text[data-principle="a"]'));
  }

  // Two names on one node select the same node whichever is clicked; only
  // the mark moves.
  add('e'); add('f');
  const shared=[...d.querySelectorAll('#lat-graph .lat-node')].find(g=>g.querySelector('text[data-principle="e"]'));
  assert.ok(shared.querySelector('text[data-principle="f"]'),'E and F share a node');
  tap(w,shared.querySelector('text[data-principle="e"]'));
  const sharedNow=()=>[...d.querySelectorAll('#lat-graph .lat-node')].find(g=>g.querySelector('text[data-principle="e"]'));
  assert.ok(sharedNow().classList.contains('rel-base'),'Clicking E selects the node');
  assert.deepEqual(marked(),['E']);
  tap(w,sharedNow().querySelector('text[data-principle="f"]'));
  assert.ok(sharedNow().classList.contains('rel-base'),'Clicking F selects the same node, not a node entailed by F');
  assert.deepEqual(marked(),['F'],'And the mark moves to F');
  assert.equal(d.querySelector('#pop .pop-t').textContent,'F','While the popup follows the click');
  w.eval('lattice.shown=["a","b"];renderLattice();');
  tap(w,d.querySelector('#lat-graph text[data-principle="a"]'));

  // An ∧: the conjunction, with each conjunct and its statement.
  tap(w,d.querySelector('#lat-graph .lat-meet'));
  assert.equal(d.querySelector('#pop .pop-t').textContent,'A ∧ B','The ∧ names its conjunction');
  assert.match(pop.textContent,/Statement of A/);
  assert.match(pop.textContent,/Statement of B/);

  // An arrow: where it comes from, and what rules the converse out.
  const settled=[...d.querySelectorAll('#lat-graph .lat-edge:not(.may-reverse)')][0];
  tap(w,settled.closest('[data-lat-edge]'));
  assert.match(pop.textContent,/⇒/,'The arrow states its implication');
  assert.match(pop.textContent,/Why/,'It says where it comes from');
  assert.match(pop.textContent,/Converse/,'And reports the converse');
  assert.ok(pop.querySelectorAll('[data-model]').length||/contradiction|background already gives/.test(pop.textContent),
    'A settled arrow names the model that rules its converse out, unless it is one of the constants');
  assert.doesNotMatch(pop.textContent,/might yet/,'A settled arrow does not hedge');
  const openArrow=[...d.querySelectorAll('#lat-graph .lat-edge.may-reverse')][0];
  assert.ok(openArrow,'The fixture has an arrow whose converse is open');
  tap(w,openArrow.closest('[data-lat-edge]'));
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
  tap(w2,beEdge.closest('[data-lat-edge]'));
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
  assert.ok(!visible('graph-options')&&visible('graph-principles'),'The arrow options are set aside; the principles show');

  // The same three moves from the lattice's details pane, acting on the
  // lattice's own choices.
  d2.querySelector('.tab[data-tab="lattice"]').click();
  w2.eval('lattice.shown=["a","b"];renderLattice();');
  const act=kind=>d2.querySelector(`#lat-legend [data-selection-action="${kind}"]`);
  tap(w2,d2.querySelector('#lat-graph text[data-principle="a"]'));
  assert.ok(act('hide')&&act('negate')&&act('background'),'A lattice principle offers the three moves');
  act('negate').click();
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),['a','b','!a'],'Adding the negation adds it as a generator');
  assert.equal(d2.querySelector('#pane-lattice [data-lat-negative="a"]').getAttribute('aria-pressed'),'true','As the sidebar shows');
  assert.ok(!act('negate'),'And the offer is withdrawn');
  act('hide').click();
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),['b','!a'],'Hiding drops the literal, and only that literal');
  assert.equal(w2.eval('state.focus'),null,'Nothing is selected any more');
  tap(w2,d2.querySelector('#lat-graph .lat-meet'));
  assert.equal(act('negate').textContent,'Add negations','An ∧ offers them for its conjuncts together');
  act('background').click();
  assert.ok(w2.eval('background.has("b") && negativeBackground.has("a")'),'Moving to background assumes each conjunct with its sign');
  assert.deepEqual(JSON.parse(w2.eval('JSON.stringify(lattice.shown)')),[],'And they stop being generators');
  assert.ok(d2.querySelector('#pane-lattice [data-lat-row="a"]').classList.contains('in-background'),'As the sidebar shows');
  w2.eval('resetBackground()');

  // A pan is not a click on empty space: the diagram moves and the selection
  // stays, as on the graph.
  w.eval('lattice.shown=["a","b"];lattice.builtKey=null;renderLattice();');
  tap(w,d.querySelector('#lat-graph text[data-principle="a"]'));
  assert.equal(w.eval('state.focus'),'a','A tap selects');
  const panned=+w.eval('lattice.view.tx');
  drag(w,d.getElementById('lat-graph'));
  assert.notEqual(+w.eval('lattice.view.tx'),panned,'A drag pans the diagram');
  assert.equal(w.eval('state.focus'),'a','And leaves the selection alone');
  assert.ok(d.querySelector('#lat-graph .lat-node.rel-base'),'The node is still marked');

  // E and F are equivalent, so choosing both and selecting one offers to drop
  // the other: it adds a name to the node and nothing else.
  w.eval('lattice.shown=["e","f"];lattice.builtKey=null;renderLattice();');
  tap(w,d.querySelector('#lat-graph text[data-principle="e"]'));
  const equiv=()=>d.querySelector('#lat-legend [data-selection-action="equivalents"]');
  assert.ok(equiv(),'The offer is made');
  equiv().click();
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.shown)')),['e'],'And drops the equivalent, not the selection');
  assert.equal(equiv(),null,'Then withdraws');
  w.eval('lattice.shown=[];lattice.builtKey=null;select(null);renderLattice();');

  // The map's other names for the selection. E and F entail each other, and
  // only E is chosen, so F is offered to be shown or swapped in.
  w.eval('lattice.shown=["e"];lattice.builtKey=null;renderLattice();');
  tap(w,d.querySelector('#lat-graph text[data-principle="e"]'));
  const others=()=>[...d.querySelectorAll('#pop .equivalent-names li [data-principle]')].map(b=>b.dataset.principle);
  assert.deepEqual(others(),['f'],'The equivalent principle is listed');
  assert.equal(d.querySelector('#pop [data-equivalent-show="f"]').textContent,'show','One the lattice is not showing offers to show');
  d.querySelector('#pop [data-equivalent-show="f"]').click();
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.shown)')).sort(),['e','f'],'Which adds it as a generator');
  assert.equal(d.querySelector('#pop [data-equivalent-show="f"]').textContent,'hide');
  d.querySelector('#pop [data-equivalent-show="f"]').click();
  d.querySelector('#pop [data-equivalent-replace="f"]').click();
  assert.deepEqual(JSON.parse(w.eval('JSON.stringify(lattice.shown)')),['f'],'Replace swaps it into the diagram');
  assert.equal(w.eval('state.focus'),'f','And the selection follows it there');
  w.eval('lattice.shown=[];lattice.builtKey=null;select(null);renderLattice();');

  // The Lean filter is one control, in the block the sources live in, so every
  // view that has sources can reach it: the lattice is drawn from the same
  // arrows the graph is, and this narrows both.
  const reachable=el=>{for(let n=el;n&&n.nodeType===1;n=n.parentElement) if(w.getComputedStyle(n).display==='none') return false; return true;};
  const lean=d.getElementById('lean-only');
  assert.ok(lean,'There is one Lean filter, not one per view');
  assert.equal(lean.closest('label').textContent.trim(),'Lean-verified only');
  assert.ok(lean.closest('label').querySelector('.sw.lean'),'With the graph\'s own swatch');
  for (const tab of ['graph','lattice','open']) {
    d.querySelector(`.tab[data-tab="${tab}"]`).click();
    assert.ok(reachable(lean),`It is reachable on the ${tab} tab`);
  }
  d.querySelector('.tab[data-tab="lattice"]').click();
  w.eval('lattice.shown=["a","b"];lattice.builtKey=null;renderLattice();');
  const ruledOut=()=>JSON.parse(w.eval('JSON.stringify(lattice.edges.filter(e=>e.reverses!=="open").length)'));
  assert.ok(ruledOut()>0,'Some cover is settled by a model');
  lean.checked=true; lean.dispatchEvent(new w.Event('change',{bubbles:true}));
  w.eval('lattice.builtKey=null;renderLattice();');
  assert.equal(ruledOut(),0,'With Lean only, no unverified model settles anything');
  lean.checked=false; lean.dispatchEvent(new w.Event('change',{bubbles:true}));
  w.eval('lattice.shown=[];lattice.builtKey=null;renderLattice();');

  // The toolbar matches the graph's: a box to find a principle on the left,
  // Flip and Fit together on the right.
  const tools=d.querySelector('#pane-lattice .graph-tools');
  assert.ok(tools.querySelector('#lat-search'),'The lattice has a search box');
  assert.equal(w.getComputedStyle(tools.querySelector('.graph-tool-buttons')).marginLeft,'auto','Its buttons sit to the right, as the graph\'s Fit does');
  assert.deepEqual([...tools.querySelectorAll('.graph-tool-buttons .btn')].map(b=>b.id),['lat-flip','lat-fit'],'Flip beside Fit');

  // The search reads the same as the graph's, over the same principles.
  w.eval('lattice.shown=["a"];lattice.builtKey=null;renderLattice();');
  const finder=d.getElementById('lat-search'), status=()=>d.getElementById('lat-search-status').textContent;
  const type=value=>{finder.value=value;finder.dispatchEvent(new w.Event('input',{bubbles:true}));};
  type('c');
  assert.equal(d.querySelector('#lat-filters .lat-row.search-current')?.dataset.latRow,'c','It finds the row in the sidebar');
  assert.match(status(),/1 of 1/,'And says where it is');
  assert.match(status(),/Not on the diagram/,'A principle nobody chose has no node, and the readout says so');
  assert.equal(d.querySelector('#lat-graph .lat-node.search-current'),null);
  type('a');
  assert.doesNotMatch(status(),/Not on the diagram/,'A chosen one is on the diagram');
  assert.ok(d.querySelector('#lat-graph .lat-node.search-current'),'And its node is marked');
  assert.equal(d.getElementById('graph-search').value,'a','One query, shown in both boxes');
  finder.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
  assert.equal(finder.value,''); assert.equal(status(),'');
  assert.equal(d.getElementById('graph-search').value,'','Clearing clears both');

  // Flip turns the lattice over: the floor rises, and an arrow still leaves
  // the side of its box that faces the other end.
  w.eval('lattice.shown=["a","b"];lattice.builtKey=null;renderLattice();');
  const geom=()=>JSON.parse(w.eval('JSON.stringify({top:lattice.nodes.find(n=>n.top).y,bottom:lattice.nodes.find(n=>n.bottom).y,ends:lattice.edges.map(e=>[e.from.y+Math.sign(e.to.y-e.from.y)*e.from.h/2,e.to.y-Math.sign(e.to.y-e.from.y)*e.to.h/2])})'));
  const upright=geom();
  assert.ok(upright.bottom>upright.top,'⊥ starts at the foot');
  const drawn=()=>[...d.querySelectorAll('#lat-graph .lat-edge')].map(p=>p.getAttribute('d'));
  const uprightPaths=drawn();
  d.getElementById('lat-flip').click();
  const over=geom();
  assert.ok(over.bottom<over.top,'Flipped, it rises to the top');
  assert.equal(over.top+over.bottom,upright.top+upright.bottom,'The diagram is reflected, not moved');
  for (const [i,[y1,y2]] of over.ends.entries())
    assert.ok(drawn()[i].includes(`,${y1} L`)&&drawn()[i].endsWith(`,${y2}`),'Each arrow attaches to the facing sides');
  d.getElementById('lat-flip').click();
  assert.deepEqual(drawn(),uprightPaths,'Flipping twice restores the diagram exactly');

  // Two ways to carry a choice of principles into the lattice, since the graph
  // is legible at seventy and the lattice at about eight.
  const d3=page(fixture).window.document, w3=d3.defaultView;
  w3.eval('select({type:"principle", id:"a"}); select({type:"principle", id:"b"}, true);');
  const toLattice=d3.querySelector('#relation-legend [data-selection-action="lattice"]');
  assert.ok(toLattice,'A selection on the graph offers to draw its lattice');
  assert.equal(toLattice.textContent,'lattice');
  toLattice.click();
  assert.equal(w3.eval('state.tab'),'lattice','Which opens the lattice');
  assert.deepEqual(JSON.parse(w3.eval('JSON.stringify(lattice.shown)')),['a','b'],'Generated by what was selected');
  assert.equal(d3.querySelector('#lat-legend [data-selection-action="lattice"]'),null,'The lattice does not offer itself');

  // And the sidebar takes whatever the graph is showing, negations included,
  // leaving assumptions out since they are not generators.
  w3.eval('select(null); state.excluded=new Set(["c","d"]); state.negativeShown=new Set(["b"]); setAssumption("e","positive"); repaintGraph();');
  d3.getElementById('lat-from-graph').click();
  assert.deepEqual(JSON.parse(w3.eval('JSON.stringify(lattice.shown)')).sort(),['!b','a','b','f'],
    'Everything shown, in the form the graph shows it, and nothing assumed');

  // Too many to draw: the readout says how many would be workable.
  const many={...fixture, principles:Array.from({length:12},(_,i)=>({id:'p'+i,name:'P'+i,statement:'S'})), results:[], models:[]};
  const d4=page(many).window.document, w4=d4.defaultView;
  d4.querySelector('.tab[data-tab="lattice"]').click();
  w4.eval('lattice.shown=ids.slice(); lattice.builtKey=null; renderLattice();');
  assert.ok(w4.eval('lattice.capped'),'Twelve unrelated principles outrun the diagram');
  const warning=d4.getElementById('lat-warning');
  assert.equal(warning.hidden,false,'Which is said outright');
  assert.match(warning.textContent,/These 12 choices generate more than 220 conjunctions/);
  assert.match(warning.textContent,/Choose about 8\./,'And the readout names a workable number');
  assert.match(d4.getElementById('lat-count').textContent,/12 chosen: more than 220 conjunctions, so nothing is drawn\./);

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: pane visibility, constants naming their own nodes, only chosen principles named, unchosen meets drawn as ∧ circles that become boxes once chosen, no nesting, inconsistent meets folded into the floor, open covers marked, negations as generators, a shared background whose dock follows the view, and clicks that reuse the graph\'s own selection for principles, conjunctions and arrows, with the floor excluded, the chosen name marked, equivalent names selecting one node, and a source selector shared with the graph that redraws the lattice from the selected sources alone, two routes from the graph into the lattice and a cap that names a workable number, hide / add negation / move to background offered on the selection, a search box and Flip beside Fit in a toolbar laid out as the graph\'s.');
}finally{pages.forEach(p=>p.window.close());}

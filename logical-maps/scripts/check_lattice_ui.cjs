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
// separates it from A, so that cover's converse stays open.
const fixture={topic:{id:'lat',title:'Lattice fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles:['a','b','c','d','e'].map(id=>({id,name:id.toUpperCase(),statement:id})),
  results:[rule('abc',['a','b'],'c'),rule('ca',['c'],'a'),rule('cb',['c'],'b'),rule('adf',['a','d'],false),rule('ea',['e'],'a')],
  models:[model('m1',['a'],['b','c','e']),model('m2',['b'],['a','c']),model('m3',['d'],['a','c'])]};
const pages=[],errors=[];
function page(){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(fixture)),{url:'https://maps.example/?assume=',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
  pages.push(dom);return dom;}
try{
  const dom=page(),w=dom.window,d=w.document;
  d.querySelector('.tab[data-tab="lattice"]').click();
  assert.equal(d.getElementById('pane-lattice').dataset.active,'true','The lattice has its own pane');
  const snap=()=>JSON.parse(w.eval('JSON.stringify({n:lattice.nodes.length,e:lattice.edges.length,labels:lattice.nodes.map(x=>x.label),open:lattice.edges.filter(x=>x.reverses==="open").length})'));
  const add=id=>{w.eval(`latticeToggle(${JSON.stringify(id)})`);return snap();};

  // It opens with the two constants and nothing else.
  let s=snap();
  assert.deepEqual(s.labels.slice().sort(),['⊤','⊥'],'The empty lattice is just the two constants');

  // Each principle joins as its own node; their meet is named after C.
  add('a'); s=add('b');
  assert.ok(s.labels.includes('A')&&s.labels.includes('B'),'Both chosen principles appear');
  assert.ok(s.labels.includes('C'),'A meet equivalent to a named principle is shown under that name');
  assert.ok(!s.labels.some(l=>l.includes('∧')),'So it is not also drawn as a conjunction');
  assert.equal(s.n,5,'Two principles, their meet and the two constants');

  // Nothing nests: every node is its own box in the diagram.
  assert.equal(d.querySelectorAll('#lat-graph [data-lat-node]').length,s.n,'Every node is drawn separately');
  assert.equal(d.querySelectorAll('#lat-graph [data-lat-node] [data-lat-node]').length,0,'No node is nested inside another');

  // An incompatible partner folds into the floor rather than adding a node.
  const before=snap().n;
  s=add('d');
  assert.equal(s.labels.filter(l=>l==='⊥').length,1,'The floor stays a single node');
  assert.ok(s.n>before,'D itself is added');
  assert.ok(!s.labels.some(l=>l.includes('A ∧ D')),'Its inconsistent meet with A is the floor, not a node of its own');
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

  // The sidebar has no control for adding many at once.
  assert.equal(d.querySelectorAll('#lat-filters [data-category-select], #lat-filters [data-show-negative]').length,0,
    'The lattice sidebar offers no bulk or negative controls');
  assert.ok(d.querySelectorAll('#lat-filters [data-lat-principle]').length===fixture.principles.length,'It lists every principle');

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: constants at the start, one principle at a time, meets named after equivalent principles, no nesting, inconsistent meets folded into the floor, open covers marked, and a sidebar without bulk controls.');
}finally{pages.forEach(p=>p.window.close());}

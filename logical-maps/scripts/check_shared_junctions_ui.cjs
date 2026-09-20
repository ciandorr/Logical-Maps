// NODE_PATH=/path/to/node_modules node scripts/check_shared_junctions_ui.cjs
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..'),template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
const rule=(id,premises,conclusion,status='proved',source_id='paper')=>({id,premises,conclusion,status,certificate:{source_id,lean:'none'},sources:['Fixture'],source_names:['Fixture']});
function page(data){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url:'https://maps.example/?assume=',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);
  // These fixtures assert over the full arrow set, so turn off the default transitive reduction.
 dom.window.document.getElementById('reduce-arrows').click();
 return dom;}
const fixture={topic:{id:'shared',title:'Shared premises',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'},{id:'draft',name:'Draft',kind:'misc'}]},principles:['a','b','c','d','e','f','g','x'].map(id=>({id,name:id.toUpperCase(),statement:id})),results:[rule('abc',['a','b'],'c'),rule('bad',['b','a'],'d','proved','draft'),rule('ce',['c'],'e'),rule('abxf',['a','b','x'],'f'),rule('abg',['a','b'],'g','conjectured','draft')],models:[]};
const graph=dom=>JSON.parse(dom.window.eval('JSON.stringify(buildGraph())'));
function uniqueJunctions(g){const seen=new Set();for(const j of g.nodes.filter(n=>n.kind==='junction')){const inputs=g.edges.filter(e=>e.to===j.id).map(e=>e.from).sort();const key=JSON.stringify(inputs);assert.ok(!seen.has(key),'One junction per displayed signed premise set');seen.add(key);assert.ok(inputs.length>=2);assert.equal(inputs.length,new Set(inputs).size);assert.ok(j.parent||g.edges.some(e=>e.from===j.id));}}
try{
 const dom=page(fixture),w=dom.window,d=w.document;
 // Premise strokes are solid ink, a little thinner than an ordinary arrow and
 // scaling with the view so the difference holds at any zoom. Measured before
 // anything is hovered, since hovering widens whichever edge is under it.
 const plain=sel=>w.getComputedStyle(d.querySelector('.edge-g:not(.hot) '+sel));
 const premise=plain('.edge.premise'), ordinary=plain('.edge.source');
 assert.equal(premise.strokeDasharray,'none','Premise strokes are not dashed');
 assert.equal(premise.stroke,'var(--ink-2)','Premise strokes are lighter than label ink');
 assert.ok(!['var(--derived)','var(--ink-3)'].includes(premise.stroke),'And stay clear of the derived and trivial-arrow colours');
 assert.ok(!premise.vectorEffect||premise.vectorEffect==='none','Premise strokes scale with the view like every other edge');
 const pw=parseFloat(premise.strokeWidth), ow=parseFloat(ordinary.strokeWidth);
 assert.ok(pw<ow,'A premise stroke is thinner than an ordinary arrow');
 assert.ok(pw>ow*0.8,'But only a little thinner: it is not a lesser kind of edge');
 let g=graph(dom);uniqueJunctions(g);
 const ab=g.nodes.find(n=>n.id==='j:abc');assert.ok(ab.shared);
 assert.deepEqual(g.edges.filter(e=>e.from===ab.id).map(e=>e.conclusion||e.b).sort(),['c','d','e']);
 assert.equal(g.edges.filter(e=>e.to===ab.id).length,2);
 assert.ok(!g.nodes.some(n=>n.id==='j:bad'));
 const outgoing=g.edges.find(e=>e.key==='bad');w.hover({result:outgoing.key});
 assert.equal(d.querySelector('[data-edge="abc"]:not([data-to="j:abc"])').classList.contains('hot'),false,'Inspecting D must not highlight sibling consequence C');
 assert.equal(d.querySelectorAll('[data-to="j:abc"].hot').length,2,'Both shared premise links highlight');
 w.handleGraphClick(d.querySelector('[data-graph-node="j:abc"]'));
 assert.equal(d.querySelector('#pop .pop-t').textContent,'A ∧ B');
 assert.equal(d.querySelectorAll('#pop [data-graph-connection]').length,3);
 d.querySelector('#pop [data-graph-connection="bad"]').click();assert.match(d.querySelector('#pop').textContent,/Draft/);
 const derived=g.edges.find(e=>e.from===ab.id&&e.b==='e');
 w.handleGraphClick(d.querySelector(`[data-edge="${derived.key}"]`));
 assert.match(d.querySelector('#pop').textContent,/Derived proof/);
 assert.deepEqual([...d.querySelectorAll('#pop [data-result]')].map(e=>e.dataset.result).sort(),['abc','ce']);
 assert.match(d.querySelector(`[data-edge="${derived.key}"] title`).textContent,/Derived proof/);
 assert.equal(w.getComputedStyle(d.querySelector('.edge.derived')).strokeDasharray,'none','Proved derived arrows are solid');
 assert.equal(d.querySelectorAll('[data-to="j:abc"] .direction-chevron').length,0,'Premise collection links do not claim implication flow');
 w.changeBackground('x',true);g=graph(dom);uniqueJunctions(g);assert.equal(g.nodes.filter(n=>n.kind==='junction').length,1,'Background reductions merge formerly different premise sets');
 assert.deepEqual(g.edges.filter(e=>e.from==='j:abc').map(e=>e.conclusion||e.b).sort(),['c','d','e','f']);
 d.getElementById('show-conj').click();g=graph(dom);uniqueJunctions(g);
 assert.equal(g.nodes.filter(n=>n.kind==='junction').length,1,'Conjectures share premises without changing proof status');
 assert.ok(d.querySelector('[data-edge="abg"] .edge.conjectured'));
 assert.ok(!d.querySelector('[data-edge="abc"] .edge.conjectured'));
 d.querySelector('[data-source-filter="paper"]').click();g=graph(dom);uniqueJunctions(g);
 assert.deepEqual(g.edges.filter(e=>e.fromJunction).map(e=>e.conclusion||e.b).sort(),['d','g']);
 // Negated premises are separate inputs, even when the positive nodes coincide.
 const signed=page({...fixture,results:[rule('abc',['a','b'],'c'),rule('acd',['a','c'],'d')]});
 signed.window.eval("state.negativeShown=new Set(['b','c','d']);renderAll(true)");uniqueJunctions(graph(signed));
 // Real topic across the default and named backgrounds, with conjectures enabled.
 const real=page(JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8')));
 for(const preset of [null,'du','dtu']){real.window.resetBackground();if(preset)real.window.addBackgroundPreset(preset);real.window.document.getElementById('show-conj').checked=true;real.window.eval('state.showConj=true;renderAll(true)');uniqueJunctions(graph(real));assert.ok(real.window.eval("layout.edges.every(e=>!e.geometry.d.includes('NaN'))"));}
 assert.deepEqual(errors.map(String),[]);
 console.log('PASS: shared conjunctions, background merging, separate signed inputs, source/conjecture preservation, targeted hover, and inspectable solid derived proofs.');
}finally{pages.forEach(p=>p.window.close());}

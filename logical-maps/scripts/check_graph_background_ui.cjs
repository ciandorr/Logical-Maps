// NODE_PATH=/path/to/node_modules node scripts/check_graph_background_ui.cjs
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const rule=(id,premises,conclusion,source_id,status='proved')=>({id,premises,conclusion,status,certificate:{source_id,lean:'none'},sources:['Fixture'],source_names:['Fixture']});
const data={topic:{id:'background-fixture',title:'Background fixture',background:[],source_catalog:[{id:'hidden',name:'Background proof',kind:'published-paper'},{id:'shown',name:'Displayed proof',kind:'misc'}]},
 principles:['a','b','c','d','e','f','z','k'].map(id=>({id,name:id.toUpperCase(),statement:id})),models:[],results:[
 rule('k',[],'k','hidden'),rule('ab',['a'],'b','hidden'),rule('bcd',['b','c'],'d','shown'),rule('de',['d'],'e','shown'),
 rule('az',['a','z'],false,'hidden'),rule('bf',['b'],'f','hidden','conjectured'),rule('cfe',['c','f'],'e','hidden','conjectured')]};
const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
const dom=new JSDOM(fs.readFileSync(path.join(root,'viewer/template.html'),'utf8').replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url:'https://maps.example/?assume=a',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
const w=dom.window,d=w.document;
try{
 // The reader's assumption A sits in the True box, where its consequences
 // go; K, which the topic's own background proves outright, starts hidden.
 const box=id=>[...d.querySelectorAll('#nodes .node')].find(n=>(n.dataset.members||'').split(',').includes(id));
 assert.ok(box('a')&&box('a').dataset.members.split(',').includes('⊤'),'An assumption shares the True box');
 assert.ok(!box('k'),'A theorem of the fixed background starts hidden');
 assert.equal(d.querySelector('[data-show-positive="k"]').getAttribute('aria-pressed'),'false','And its sidebar box is unchecked');
 d.querySelector('[data-show-positive="k"]').click();
 assert.ok(box('k')&&box('k').dataset.members.split(',').includes('⊤'),'Checked, it joins the True box');
 d.querySelector('[data-show-positive="k"]').click();
 d.querySelector('[data-source-filter="hidden"]').click();
 assert.equal(w.eval("literalFollows('b')"),true,'Background proof survives its hidden arrow');
 assert.equal(w.eval("literalFollows('!z')"),true,'Automatic exclusions also survive');
 assert.equal(w.eval("literalPair('z','e').status"),'inconsistent','Transitive queries respect automatic exclusions');
 assert.ok(w.eval("literalPair('z','e').via.includes('az')"),'Automatic exclusion retains its hidden proof');
 assert.equal(w.eval("E.entails([], 'b')"),null,'Evidence-filtered explorer engine remains independent');
 const transitive=JSON.parse(w.eval("JSON.stringify(literalPair('c','e'))"));
 assert.equal(transitive.status,'implies');
 assert.deepEqual(transitive.via,['ab','bcd','de'],'Transitive proof keeps the hidden background derivation in its provenance');
 d.getElementById('show-conj').click();
 assert.equal(w.eval("literalFollows('f')"),false,'A conjecture cannot make a premise automatic');
 assert.equal(w.eval("buildGraph().edges.some(e=>e.key==='cfe')"),false,'Proved C ⇒ E supersedes conjectured C ∧ F ⇒ E');
 d.querySelector('[data-source-filter="shown"]').click();
 assert.equal(w.eval("buildGraph().edges.some(e=>e.key==='cfe')"),false,'Hiding the resolving proof does not restore a conjecture arrow');
 assert.equal(w.eval("literalPair('c','e').status"),'open','Hiding an unrelated proof still removes its transitive arrows');
 assert.equal(w.eval("literalFollows('b')"),true);
 w.changeBackground('z',true);
 assert.equal(d.getElementById('graph-warning').hidden,false,'All-hidden sources cannot conceal an inconsistent background');
 assert.match(d.getElementById('graph-warning').textContent,/Background proof/);
 assert.equal(w.getComputedStyle(d.querySelector('#pane-graph .graph-tools')).visibility,'hidden','The search box and Fit button do not show around the warning panel');
 w.changeBackground('z',false);w.changeBackground('a',false);
 assert.equal(w.eval("literalFollows('b')"),false);assert.equal(w.eval("literalFollows('!z')"),false);
 const conjecture=JSON.parse(w.eval("JSON.stringify(buildGraph().edges.find(e=>e.key==='cfe'))"));
 assert.deepEqual(conjecture.premises,['c','f'],'Removing the resolving background restores the now-open conjecture');
 assert.deepEqual(errors.map(String),[]);
 console.log('PASS: assumptions shown in the True box, settled principles hidden by default, hidden background proofs remain automatic and traceable, preserve exclusions and consistency, and never use conjectures as facts.');
}finally{w.close();}

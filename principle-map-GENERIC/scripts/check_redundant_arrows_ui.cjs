// NODE_PATH=/path/to/node_modules node scripts/check_redundant_arrows_ui.cjs
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const template=fs.readFileSync(path.join(__dirname,'../viewer/template.html'),'utf8');
const pages=[],errors=[];
const rule=(id,premises,conclusion,status='proved',source_id='weak')=>({id,premises,conclusion,status,certificate:{source_id,lean:'none'},sources:['Fixture'],source_names:['Fixture']});
function page(results){
 const data={topic:{id:'redundancy',title:'Redundancy',background:[],source_catalog:[{id:'strong',name:'Stronger implication',kind:'published-paper'},{id:'weak',name:'Other implications',kind:'misc'}]},principles:['a','b','c','d','x','z'].map(id=>({id,name:id.toUpperCase(),statement:id})),results,models:[]};
 const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
 const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url:'https://maps.example/?assume=',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);return dom;
}
const graph=dom=>JSON.parse(dom.window.eval('JSON.stringify(buildGraph())'));
const arrows=dom=>graph(dom).edges.filter(e=>!e.toJunction);
const has=(dom,premises,conclusion)=>arrows(dom).some(e=>(e.conclusion||e.b)===conclusion&&JSON.stringify([...e.premises].sort())===JSON.stringify([...premises].sort()));
function noOrphans(dom){
 const g=graph(dom);
 for(const j of g.nodes.filter(n=>n.kind==='junction')){
  assert.ok(g.edges.some(e=>e.from===j.id&&!e.toJunction));
  assert.ok(g.edges.filter(e=>e.to===j.id).length>=2);
 }
 for(const e of g.edges)assert.ok(g.nodes.some(n=>n.id===e.from)&&g.nodes.some(n=>n.id===e.to));
}
try{
 const dom=page([rule('context',['a','x'],'c','proved','strong'),rule('wide',['a','b'],'c'),rule('cd',['c'],'d')]);
 assert.ok(has(dom,['a','b'],'c'));
 dom.window.changeBackground('x',true);
 assert.ok(has(dom,['a'],'c'));assert.ok(has(dom,['a'],'d'),'Keep singleton transitive arrows');
 assert.ok(has(dom,['c'],'d'));
 assert.ok(!has(dom,['a','b'],'c'));assert.ok(!has(dom,['a','b'],'d'),'Prune redundant transitive conjunction arrows too');
 assert.ok(!graph(dom).nodes.some(n=>n.id==='j:wide'),'Remove empty junction and all its incoming strokes');
 noOrphans(dom);
 dom.window.document.querySelector('[data-source-filter="strong"]').click();
 assert.ok(has(dom,['a','b'],'c'),'Hiding the stronger proof restores the applicable conjunction');
 dom.window.document.querySelector('[data-source-filter="strong"]').click();
 dom.window.changeBackground('x',false);
 assert.ok(has(dom,['a','b'],'c'),'Removing background restores the necessary conjunction');
 // A junction can retain a different conclusion that genuinely needs both inputs.
 const retained=page([rule('narrow',['a'],'c','proved','strong'),rule('wide',['a','b'],'c'),rule('cd',['c'],'d'),rule('bdz',['b','d'],'z')]);
 assert.ok(!has(retained,['a','b'],'c'));
 assert.ok(has(retained,['a','b'],'z'));noOrphans(retained);
 const g=graph(retained),junction=g.nodes.find(n=>n.id==='j:wide');assert.ok(junction);
 retained.window.handleGraphClick(retained.window.document.querySelector('[data-graph-node="j:wide"]'));
 assert.equal(retained.window.document.querySelector('#pop .pop-t').textContent,'A ∧ B ⇒ Z','Inspect the surviving conclusion, not the suppressed original arrow');
 // Multi-premise subsets count too; unrelated premise sets must remain.
 const subsets=page([rule('small',['a','b'],'z'),rule('large',['a','b','x'],'z'),rule('other',['c','x'],'z')]);
 assert.ok(has(subsets,['a','b'],'z'));assert.ok(!has(subsets,['a','b','x'],'z'));assert.ok(has(subsets,['c','x'],'z'));noOrphans(subsets);
 // Conjectural evidence must never hide an established theorem.
 const conjectured=page([rule('guess',['a'],'c','conjectured','strong'),rule('proved-wide',['a','b'],'c')]);
 conjectured.window.document.getElementById('show-conj').click();
 assert.ok(has(conjectured,['a'],'c'));assert.ok(has(conjectured,['a','b'],'c'));
 const guesses=page([rule('guess-small',['a'],'c','conjectured'),rule('guess-large',['a','b'],'c','conjectured')]);
 guesses.window.document.getElementById('show-conj').click();
 assert.ok(has(guesses,['a'],'c'));assert.ok(!has(guesses,['a','b'],'c'));
 // Signed conclusions and False use the same subset rule.
 const negative=page([rule('ac-false',['a','c'],false),rule('abc-false',['a','b','c'],false)]);
 negative.window.eval("state.negativeShown.add('c');renderAll(true)");
 assert.ok(has(negative,['a'],'!c'));assert.ok(!has(negative,['a','b'],'!c'));
 assert.ok(has(negative,['a','c'],'false'));assert.ok(!has(negative,['a','b','c'],'false'));noOrphans(negative);
 assert.deepEqual(errors.map(String),[]);
 console.log('PASS: context-sensitive premise subsumption, restored filtered arrows, surviving junctions, conjecture discipline, signed conclusions, and retained singleton transitivity.');
}finally{pages.forEach(p=>p.window.close());}

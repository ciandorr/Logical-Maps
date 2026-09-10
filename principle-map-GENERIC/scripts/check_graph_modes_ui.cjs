// NODE_PATH=/path/to/node_modules node scripts/check_graph_modes_ui.cjs
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const rule=(id,premises,conclusion,source_id,status='proved')=>({id,premises,conclusion,status,certificate:{source_id,lean:'none'},sources:['Fixture'],source_names:['Fixture']});
const fixture={topic:{id:'graph-modes',title:'Graph modes',background:[],source_catalog:[{id:'paper',name:'Published paper',kind:'published-paper'},{id:'submission',name:'Online submission',kind:'online-submission'},{id:'draft',name:'Unpublished draft',kind:'misc'}]},principles:['background','automatic','a','b','c','d','e','f'].map(id=>({id,name:id.toUpperCase(),statement:id})),models:[],results:[
 rule('automatic',['background'],'automatic','paper'),rule('ab',['a'],'b','paper'),rule('af',['a'],'f','paper'),
 rule('ac',['a'],'c','draft'),rule('cd',['c'],'d','submission'),
 rule('published-guess',['automatic','a'],'e','paper','conjectured'),rule('draft-guess',['a','b'],'f','draft','conjectured')]};
const pages=[],errors=[];
function page(data,url){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);return dom;}
const graph=dom=>JSON.parse(dom.window.eval('JSON.stringify(buildGraph())'));
const direct=dom=>new Set(graph(dom).edges.filter(e=>e.r).map(e=>e.r.id));
const conjectural=e=>e.conjectured||e.r?.status==='conjectured';
try{
 const dom=page(fixture,'https://maps.example/?assume=background'),w=dom.window,d=w.document;
 const selectedSources=w.eval('JSON.stringify([...state.allowed])');
 const background=w.eval('JSON.stringify([...background])');
 const toggle=id=>d.getElementById(id).click();
 toggle('conjecture-only');
 assert.ok(graph(dom).edges.length>0);assert.ok(graph(dom).edges.every(conjectural));
 assert.deepEqual([...direct(dom)].sort(),['draft-guess','published-guess'],'Only mode reveals conjectures, including one superseded by a hidden proved arrow');
 assert.ok(graph(dom).edges.find(e=>e.r?.id==='published-guess').premises.every(p=>p!=='automatic'));
 assert.equal(w.eval("literalFollows('automatic')"),true,'Published background proof still applies');
 assert.equal(d.getElementById('show-conj').checked,true);assert.equal(d.getElementById('show-conj').disabled,true);
 assert.equal(d.getElementById('show-iso').checked,false);assert.equal(d.getElementById('show-iso').disabled,true);
 assert.equal(w.eval("E.entails(['a'],'b') !== null"),true,'Graph modes do not change selected evidence in other views');
 assert.equal(w.eval('JSON.stringify([...state.allowed])'),selectedSources);assert.equal(w.eval('JSON.stringify([...background])'),background);
 toggle('unpublished-only');
 assert.deepEqual([...direct(dom)],['draft-guess'],'Both modes intersect');
 toggle('lean-only');assert.equal(graph(dom).edges.length,0);
 assert.equal(d.getElementById('graph-empty').hidden,false);assert.match(d.getElementById('graph-empty').textContent,/Lean-verified only/);
 toggle('lean-only');toggle('conjecture-only');
 assert.deepEqual([...direct(dom)].sort(),['ac','cd'],'Unpublished includes submissions and miscellaneous sources');
 assert.ok(graph(dom).edges.some(e=>e.type==='derived'&&e.a==='a'&&e.b==='d'),'Unpublished transitive consequences remain');
 assert.equal(d.getElementById('show-conj').checked,false,'Restore previous conjecture preference');
 assert.equal(d.getElementById('show-iso').disabled,true,'The other only mode still hides isolated nodes');
 toggle('unpublished-only');assert.equal(d.getElementById('show-iso').checked,true);assert.equal(d.getElementById('show-iso').disabled,false);
 assert.ok(direct(dom).has('ab'));
 // Preserve an explicitly enabled conjecture preference, and reveal matches
 // after the principle list has been cleared.
 toggle('show-conj');toggle('pr-none');toggle('conjecture-only');
 assert.ok(graph(dom).edges.length>0);toggle('conjecture-only');
 assert.equal(d.getElementById('show-conj').checked,true);
 assert.equal(w.eval('JSON.stringify([...state.allowed])'),selectedSources);
 const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
 const real=page(data,'https://maps.example/');real.window.addBackgroundPreset('dtu');
 real.window.document.getElementById('conjecture-only').click();
 assert.ok(graph(real).edges.every(conjectural));
 const cancellation=graph(real).edges.find(e=>e.key==='conjectured-dtu-cancellation-implies-preservation');
 assert.deepEqual(cancellation.premises,['independent-sum-cancellation']);
 assert.ok(!graph(real).edges.some(e=>e.premises.includes('simple-eu')));
 real.window.document.getElementById('unpublished-only').click();
 assert.ok(graph(real).edges.length>0);assert.ok(graph(real).edges.every(conjectural));
 assert.deepEqual(errors.map(String),[]);
 console.log('PASS: graph-only conjecture/unpublished modes, intersection, published background consequences, restored controls, cleared principles, Lean empty state, and DTU.');
}finally{pages.forEach(p=>p.window.close());}

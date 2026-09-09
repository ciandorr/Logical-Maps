// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
const fs=require('node:fs'), path=require('node:path'), assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
function page(data,url='http://localhost/'){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);return dom;}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const fixture={topic:{id:'fixture',title:'Fixture',background:[],source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'},{id:'submission',name:'A submission',kind:'online-submission'}]},principles:'abcde'.split('').map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`})),results:[{id:'ea',premises:['e'],conclusion:'a',status:'proved',certificate:cert('paper')},{id:'conflict',premises:['a','b','c','d'],conclusion:false,status:'proved',certificate:cert('submission'),proof:'The four premises contradict each other.',sources:['Fixture theorem'],source_names:['A submission']}],models:[{id:'m',name:'ABC model',satisfies:['a','b','c'],violates:[],status:'proved',certificate:cert('paper'),sources:['Fixture construction'],source_names:['A paper']}]};
const dom=page(fixture),w=dom.window,d=w.document;
assert.ok(d.querySelector('#graph .falsity'));
assert.equal(d.querySelector('[data-pid="false"]'),null);
w.eval("handleGraphClick(document.querySelector('#graph .falsity text'))");
assert.match(d.getElementById('pop').textContent,/False/);
d.querySelector('#pop [data-goto]').click();assert.match(d.getElementById('page').textContent,/not another optional principle/);
for(const candidate of 'abcd'){
  d.getElementById('background-reset').click();
  for(const p of 'abcd')if(p!==candidate)w.eval(`changeBackground('${p}',true)`);
  assert.equal(d.getElementById('graph-warning').hidden,true);
  assert.ok(d.querySelector(`#graph .ruled-out[data-members="${candidate}"]`));
  w.eval(`select({type:'principle',id:'${candidate}'})`);
  assert.match(d.querySelector('#pop').textContent,/Ruled out by the background/);
  d.querySelector('#pop [data-result="conflict"]').click();
  assert.match(d.querySelector('#pop').textContent,/A ∧ B ∧ C ∧ D ⇒ False/);
  d.querySelector('#pop [data-goto]').click();assert.match(d.getElementById('page').textContent,/These premises cannot all hold together/);
}
w.eval("changeBackground('d',true)");
assert.equal(d.getElementById('graph-warning').hidden,false);
assert.equal(d.querySelectorAll('#graph .edge').length,0);
assert.match(d.getElementById('graph-warning').textContent,/A submission/);
d.querySelector('[data-source-filter="submission"]').click();assert.equal(d.getElementById('graph-warning').hidden,true);
d.querySelector('[data-source-filter="submission"]').click();assert.equal(d.getElementById('graph-warning').hidden,false);
d.getElementById('models-background-reset').click();assert.equal(d.getElementById('graph-warning').hidden,true);
// Models derive violations from incompatibility even when violates is empty.
d.querySelector('#models [data-model="m"]').click();
const verdict=d.querySelector('#models [data-verdict="d"]');assert.match(verdict.textContent,/✗/);
assert.match(verdict.textContent,/A paper/);assert.match(verdict.textContent,/A submission/);
verdict.click();d.querySelector('#pop [data-goto]').click();
assert.match(d.getElementById('page').textContent,/False.*contradiction/);
d.querySelector('[data-source-filter="submission"]').click();assert.equal(d.querySelector('#models [data-verdict="d"]'),null);
d.querySelector('[data-source-filter="submission"]').click();
// An impossible Models filter package gets the same warning, without changing background.
for(const p of 'abcd')d.querySelector(`#models [data-in="${p}"]`).click();
assert.match(d.querySelector('#models .ex-bad').textContent,/selected principles imply False/);
assert.equal(d.getElementById('graph-warning').hidden,true);
d.getElementById('ex-clear').click();
// Conjectures can draw a dashed falsity edge but cannot establish any failure or warning.
const conjecture=JSON.parse(JSON.stringify(fixture));conjecture.results[1].status='conjectured';
const c=page(conjecture,'http://localhost/?assume=a,b,c,d'),cd=c.window.document;
assert.equal(cd.getElementById('graph-warning').hidden,true);cd.getElementById('show-conj').click();
assert.equal(cd.getElementById('graph-warning').hidden,true);
cd.getElementById('background-reset').click();assert.ok(cd.querySelector('#graph .edge.conjectured'));
assert.equal(c.window.eval("baseE.fails.get('m').has('d')"),false);
// Check the actual migrated topic, including source-filtered proofs and singular popups.
const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
for(const id of ['dtu-refutes-archimedean-gambles','dominance-refutes-antitonic-sum']){
 assert.equal(data.results.find(r=>r.id===id)?.conclusion,'false');
}
assert.ok(!data.principles.some(p=>p.negates||p.id==='false'));
const real=page(data),rd=real.window.document;
assert.ok(rd.querySelector('#graph .falsity'));
// DU excludes Totality; DTU adds it. Both tabs share these removable presets.
const du=['rich-outcomes','archimedean-outcomes','stochastic-equivalence','stochastic-dominance','independence'].sort();
const dtu=[...du,'totality'].sort();
const assumptions=p=>JSON.parse(p.window.eval('JSON.stringify([...background].sort())'));
assert.deepEqual(assumptions(real),du);
assert.equal(real.window.eval("background.has('simple-eu')"),false);
assert.equal(real.window.eval("E.cl([]).facts.has('simple-eu')"),true);
assert.ok(rd.querySelector('#pr-filters [data-pid="simple-eu"]'));
assert.ok(rd.querySelector('#models [data-in="simple-eu"]').classList.contains('auto'));
assert.equal(real.window.eval("E.cl([]).facts.has('totality')"),false);
assert.equal(real.window.eval("backgroundExcluded.has('totality')"),false);
for(const scope of ['#pr-filters','#models']){
 assert.equal(rd.querySelector(`${scope} [data-background-preset="du"]`).textContent,'Add DU to background');
 assert.equal(rd.querySelector(`${scope} [data-background-preset="dtu"]`).textContent,'Add DTU to background');
}
// DU visibly rules out Archimedean Gambles and Countable Sure-Thing.
for(const id of ['archimedean-gambles','countable-sure-thing']){
 const row=rd.querySelector(`#models [data-out="${id}"]`).closest('.ex-p');
 assert.ok(row.classList.contains('fout'));
 assert.ok(row.querySelector('[data-out]').classList.contains('auto'));
 assert.doesNotMatch(row.textContent,/⇐ (?:in|out)/);
}
assert.ok(rd.querySelector('#graph [data-edge="rich-simple-dominance-refutes-archimedean-gambles"]'));

for(const id of ['total-exact-ultrafilter','total-continuous-ultrafilter','affine-symmetric-extension']){
 assert.ok(rd.querySelector(`#models .ex-m [data-model="${id}"]`));
}
const incomplete=['eventual-clipped-expectation','cdf-area-preorder','cdf-conclosure-preorder'];
for(const id of incomplete)assert.ok(rd.querySelector(`#models .ex-m [data-model="${id}"]`));
rd.querySelector('#models [data-background-preset="dtu"]').click();
assert.deepEqual(assumptions(real),dtu);
assert.deepEqual(assumptions(page(data,real.window.location.href)),dtu);
for(const id of incomplete){
 assert.equal(rd.querySelector(`#models .ex-m [data-model="${id}"]`),null);
}
rd.querySelector('#models-background-list [data-remove-background="totality"]').click();
assert.deepEqual(assumptions(real),du);
assert.deepEqual(assumptions(page(data,real.window.location.href)),du);
for(const id of incomplete)assert.ok(rd.querySelector(`#models .ex-m [data-model="${id}"]`));
rd.getElementById('background-reset').click();
assert.equal(rd.querySelectorAll('#models .ex-m').length,data.models.filter(m=>m.status==='proved').length);
assert.deepEqual(assumptions(page(data,real.window.location.href)),[]);
rd.querySelector('#pr-filters [data-background-preset="du"]').click();
assert.deepEqual(assumptions(real),du);
rd.querySelector('#pr-filters [data-background-preset="dtu"]').click();
assert.deepEqual(assumptions(real),dtu);
rd.getElementById('background-reset').click();
// The stronger recorded constraint also works without the rest of DU.
for(const p of ['rich-outcomes','simple-eu','stochastic-dominance'])real.window.eval(`changeBackground('${p}',true)`);
assert.ok(real.window.eval("backgroundExcluded.has('archimedean-gambles')"));
assert.ok(rd.querySelector('#graph [data-edge="rich-simple-dominance-refutes-archimedean-gambles"]'));
real.window.eval("changeBackground('archimedean-gambles',true)");
assert.equal(rd.getElementById('graph-warning').hidden,false);
rd.getElementById('background-reset').click();

for(const b of rd.querySelectorAll('#pr-filters .principle-name')){b.click();assert.equal(rd.querySelectorAll('#pop .pop-t').length,1);}
for(const p of ['rich-outcomes','stochastic-dominance','antitonic-sum-consistency'])real.window.eval(`changeBackground('${p}',true)`);
assert.equal(rd.getElementById('graph-warning').hidden,false);
assert.match(rd.getElementById('graph-warning').textContent,/Unbounded Utility and Background Risk \(unpublished\)/);
rd.querySelector('[data-source-filter="unpublished-background-risk"]').click();
assert.equal(rd.getElementById('graph-warning').hidden,true);
assert.deepEqual(errors,[]);pages.forEach(p=>p.window.close());
console.log('PASS: falsity graph, all exclusion orientations, source evidence, model deductions/filters, conjecture isolation, and migrated topic UI.');

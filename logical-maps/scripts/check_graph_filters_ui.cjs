// NODE_PATH=/path/to/node_modules node scripts/check_graph_filters_ui.cjs
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
// The real implication questions are now resolved. Add an open fixture question
// to continue exercising filters and automatic DTU premises alongside them.
data.principles.push({id:'ui-open-target',name:'Open fixture target',statement:'Fixture'});
data.results.push({id:'ui-open-query',premises:['simple-eu','shift-invariance'],conclusion:'ui-open-target',status:'conjectured',certificate:{source_id:'misc',lean:'none'},sources:['Fixture']});
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{
 url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc,
 beforeParse(w){w.matchMedia=()=>({matches:false,addEventListener(){}});},
});
const w=dom.window,doc=w.document,pop=doc.getElementById('pop');
const inspect=()=>{doc.querySelector('#pr-filters [data-principle]').click();assert.equal(pop.hidden,false);};
const conjectures=()=>[...doc.querySelectorAll('#graph .edge.conjectured')];
try{
 const master=doc.getElementById('all-published-sources');
 const expand=doc.getElementById('expand-published-sources');
 const publishedList=doc.getElementById('published-source-list');
 const published=[...publishedList.querySelectorAll('[data-source-filter]')];
 const otherSelections=()=>[...doc.querySelectorAll('[data-source-filter]')].filter(x=>!published.includes(x)).map(x=>[x.dataset.sourceFilter,x.checked]);
 const originalOthers=otherSelections();
 assert.equal(master.closest('label').textContent.trim(),'Published papers');
 assert.ok(master.checked && !master.indeterminate);
 assert.equal(publishedList.hidden,true,'Individual papers start collapsed');
 expand.click();assert.equal(publishedList.hidden,false);assert.equal(expand.getAttribute('aria-expanded'),'true');
 published[0].click();assert.equal(master.checked,false);assert.equal(master.indeterminate,true,'Partial paper selection is visible on the parent');
 expand.click();assert.equal(publishedList.hidden,true);assert.equal(master.indeterminate,true,'Collapsing preserves individual choices');
 master.click();assert.ok(published.every(x=>x.checked));assert.equal(master.indeterminate,false);
 master.click();assert.ok(published.every(x=>!x.checked));
 assert.ok(published.every(x=>!w.eval('state.allowed').has(x.dataset.sourceFilter)));
 assert.ok(JSON.parse(w.eval('JSON.stringify(buildGraph())')).edges.every(e=>!e.r || !published.some(x=>x.dataset.sourceFilter===e.r.certificate.source_id)),'Disabled published sources do not produce direct arrows');
 assert.deepEqual(otherSelections(),originalOthers,'Published master leaves other source groups alone');
 master.click();assert.ok(published.every(x=>x.checked));assert.ok(master.checked);
 assert.equal(pop.hidden,true,'Source changes do not open details');
 // Docked details survive pointerdown; applying a filter clears stale details.
 for(const selector of ['[data-source-filter]','#lean-only','#show-conj','#conjecture-only','#unpublished-only','#show-iso']){
  inspect();
  doc.querySelector(selector).dispatchEvent(new w.MouseEvent('pointerdown',{bubbles:true}));
  assert.equal(pop.hidden,false,'Outside pointer does not dismiss docked details');
  doc.querySelector(selector).click();
  assert.equal(pop.hidden,true,selector+' reopened the dismissed popup');
  inspect();doc.querySelector(selector).click();
  assert.equal(pop.hidden,true,selector+' kept/reopened a popup on a keyboard-style click');
 }
 inspect();doc.dispatchEvent(new w.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
 doc.getElementById('show-iso').click();assert.equal(pop.hidden,true,'Escape dismissal survives redraw');
 doc.getElementById('show-iso').click();
 assert.equal(doc.getElementById('show-derived'),null,'Transitive arrows need no toggle');
 assert.equal(conjectures().length,0,'Conjectures initially hidden');
 doc.getElementById('show-conj').click();
 const ids=new Set(conjectures().map(p=>p.closest('[data-edge]').dataset.edge));
 for(const result of data.results.filter(r=>r.status==='conjectured'))assert.equal(ids.has(result.id),w.eval(`allEvidenceE.resolveConjecture(byRid.get('${result.id}')).status==='open'`),result.id+' visibility respects its resolution');
 for(const edge of conjectures()){
  assert.match(edge.closest('[data-edge]').querySelector('title').textContent,/^Conjecture:/);
  assert.equal(w.getComputedStyle(edge).getPropertyValue('vector-effect'),'non-scaling-stroke');
 }
 const conjectureEdge=conjectures()[0];w.handleGraphClick(conjectureEdge);
 assert.equal(pop.hidden,false,'Explicit arrow selection opens details');
 assert.ok(pop.querySelector('.badge.conj'),'Arrow popup identifies the conjecture');
 doc.getElementById('lean-only').click();
 assert.equal(pop.hidden,true);assert.equal(conjectures().length,0,'Unverified conjectures respect Lean-only filtering');
 doc.getElementById('lean-only').click();assert.ok(conjectures().length>0);
 for(const cb of doc.querySelectorAll('[data-source-filter]'))if(cb.checked)cb.click();
 doc.getElementById('show-iso').click();
 assert.ok(conjectures().length>0,'Conjectures remain visible with all sources off');
 assert.ok(doc.querySelector('#graph .node'),'Conjectures keep their endpoint boxes with isolated principles off');
 assert.equal(doc.querySelectorAll('#graph .edge:not(.conjectured):not(.premise)').length,0,'Only conjectural arrows remain');
 doc.getElementById('show-conj').click();doc.getElementById('pr-none').click();
 assert.equal(doc.querySelectorAll('#graph .node').length,0);
 doc.getElementById('show-conj').click();
 const restored=new Set(conjectures().map(p=>p.closest('[data-edge]').dataset.edge));
 for(const result of data.results.filter(r=>r.status==='conjectured'))assert.equal(restored.has(result.id),w.eval(`allEvidenceE.resolveConjecture(byRid.get('${result.id}')).status==='open'`),result.id+' visibility remains correct after clearing principles');
 assert.ok(doc.querySelector('#pr-filters [data-show-positive][aria-pressed="true"]'),'Principle controls reflect restored endpoints');
 assert.equal(pop.hidden,true);
 // DTU still implies Simple EU when only conjectures are drawn. Its proved
 // derivation is background context, not an extra conjectural premise.
 w.addBackgroundPreset('dtu');
 assert.equal(w.eval("literalFollows('simple-eu')"),true);
 const graph=JSON.parse(w.eval('JSON.stringify(buildGraph())'));
 assert.ok(!graph.edges.some(e=>e.key==='conjectured-dtu-cancellation-implies-preservation'),'The proved cancellation theorem is absent from conjecture-only arrows');
 assert.ok(!graph.edges.some(e=>e.key==='conjectured-dtu-shift-implies-transfer'),'Hiding the refuting source does not restore a resolved conjecture arrow');
 for(const [id,premise] of [['ui-open-query','shift-invariance']]){
  const arrow=graph.edges.find(e=>e.key===id);
  assert.ok(arrow,id+' remains visible under DTU');
  assert.deepEqual(arrow.premises,[premise],id+' has only its additional premise');
 }
 assert.ok(graph.edges.every(e=>!e.premises.includes('simple-eu')),'Simple EU is automatic, never an extra premise');
 assert.equal(doc.querySelectorAll('#graph .edge:not(.conjectured):not(.premise)').length,0,'Background proofs do not reappear as arrows');
 doc.getElementById('lean-only').click();
 assert.equal(w.eval("literalFollows('simple-eu')"),true,'Lean display filter cannot undo background consequences');
 doc.getElementById('lean-only').click();
 doc.getElementById('background-reset').click();
 assert.equal(w.eval("literalFollows('simple-eu')"),false,'Removing the background removes its automatic consequences');
 assert.deepEqual(errors.map(String),[]);
 console.log('PASS: conjecture-only graph retains DTU background consequences, restores principle boxes, preserves status, and never opens stale popups.');
}finally{dom.window.close();}

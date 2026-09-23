// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// Rebuild unbounded-utility first; the final checks use its current data.json.
// The Conjectures tab renders the rankings pmap.py stores at build time; the fixture carries them.
const fs=require('node:fs'), path=require('node:path'), assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
function page(data,url='http://localhost/?assume=') {
  const vc=new VirtualConsole();
  vc.on('jsdomError',error=>errors.push(error));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{
    url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc,
  });
  pages.push(dom);
  return dom;
}
function show(dom,tab) { dom.window.document.querySelector(`[data-tab="${tab}"]`).click(); }
function openSection(dom,id) { const det=dom.window.document.getElementById(id); det.open=true; det.dispatchEvent(new dom.window.Event('toggle')); return det; }
function keys(dom) { return [...dom.window.document.querySelectorAll('#open-recorded table.lynchpin tbody tr')].map(tr=>tr.dataset.lynchpin); }
function rowOf(dom,key) { return dom.window.document.querySelector(`#open-recorded [data-lynchpin="${key}"]`); }
function setResolved(dom,value) {
  const checkbox=dom.window.document.getElementById('show-resolved');
  if(checkbox.checked!==value) checkbox.click();
}
function visible(dom,element) {
  if(!element) return false;
  for(let node=element;node?.nodeType===1;node=node.parentElement) {
    const css=dom.window.getComputedStyle(node);
    if(node.hidden||css.display==='none'||css.visibility==='hidden') return false;
  }
  return true;
}
function assumptions(dom) { return JSON.parse(dom.window.eval('JSON.stringify([...background].sort())')); }
function graphMembership(dom) {
  return JSON.parse(dom.window.eval('JSON.stringify((()=>{const g=buildGraph();return {nodes:g.nodes.map(n=>n.id).sort(),edges:g.edges.map(e=>e.id).sort()};})())'));
}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const rule=(id,premises,conclusion,status='conjectured',source='submission',was_conjectured=false)=>({
  id,premises,conclusion,status,was_conjectured,certificate:cert(source),
  proof:status==='proved'?'Fixture proof.':'',sources:['Fixture source'],source_names:['Fixture source'],
});
const model=(id,satisfies,violates,status='conjectured',source='submission',was_conjectured=false)=>({
  id,name:id,satisfies,violates,status,was_conjectured,certificate:cert(source),
  description:status==='proved'?'Fixture construction.':'Proposed construction.',
  sources:['Fixture source'],source_names:['Fixture source'],
});
const q=(premises,conclusion,yes,no,rank,extra)=>({kind:'question',premises,conclusion,yes,no,rank,...extra});
const rec=(id,kind,notes)=>({id,kind,notes,tier:null});
// What pmap.py stores for this fixture: its settled share and, under the topic background, the
// questions its recorded conjectures ask (the ranking's own top rows are not needed here).
const recorded=[q(['b'],'false',26,0,2,{conjectures:[rec('open-model','model','')]}),q(['b'],'a',13,2,7,{conjectures:[rec('open-model','model','')]}),
  q(['a'],'b',6,2,34,{tier:'bronze',conjectures:[rec('open-query','result','Open still.')]}),
  q(['a'],'false',null,null,null,{status:'consistent',conjectures:[rec('proved-model','model','')]}),
  q(['a'],'d',null,null,null,{status:'excluded',conjectures:[rec('refuted-query','result',''),rec('proved-model','model','')]}),
  q(['a','d'],'b',null,null,null,{status:'excluded',conjectures:[rec('incompatible-query','result','')]}),
  q(['a','d'],'false',null,null,null,{status:'inconsistent',conjectures:[rec('refuted-model','model','')]}),
  q(['a'],'c',null,null,null,{status:'proved',conjectures:[rec('proved-query','result','')]})];
const progress={background:null,name:null,principles:[],negative:[],premises:2,questions:56,settled:8,open:48};
const fixture={
  topic:{id:'conjectures-fixture',title:'Conjectures fixture',background:[],
    principle_categories:[{id:'basic',name:'Basic principles'}],
    source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'},{id:'submission',name:'A submission',kind:'online-submission'}]},
  principles:['a','b','c','d','e'].map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`,category:'basic'})),
  results:[
    rule('history-result',['a'],'c','proved','paper',true),
    rule('conflict',['a','d'],false,'proved','paper'),
    {...rule('open-query',['a'],'b'),notes:'Open still.'},
    rule('proved-query',['a'],'c'),
    rule('refuted-query',['a'],'d'),
    rule('incompatible-query',['a','d'],'b'),
  ],
  models:[
    model('history-model',['a'],['d'],'proved','paper',true),
    model('open-model',['b'],['a']),
    model('proved-model',['a'],['d']),
    model('refuted-model',['a','d'],[]),
  ],
  progress:[progress],
  lynchpins:{skipped:null,reports:[{background:null,name:null,principles:[],negative:[],inconsistent_background:false,classes:[['a'],['b'],['c'],['d'],['e']],trivial:[],fitting_models:['history-model'],open:48,progress,rows:[],recorded}]},
};

try {
  const dom=page(fixture),doc=dom.window.document;
  const sidebar=doc.getElementById('graph-sidebar'),divider=doc.getElementById('sidebar-divider');
  const sourceCheckbox=doc.querySelector('[data-source-filter="paper"]');
  const graphCheckbox=doc.querySelector('#pr-filters [data-show-positive="e"]');
  graphCheckbox.click();
  const originalGraph=graphMembership(dom);

  // A single sidebar is moved, preserving its controls, selection, source state
  // and resize handles, rather than duplicating state across the two tabs.
  show(dom,'open');
  assert.ok(doc.getElementById('pane-open').contains(sidebar));
  assert.ok(doc.getElementById('pane-open').contains(divider));
  assert.equal(doc.querySelectorAll('#graph-sidebar').length,1);
  assert.equal(doc.querySelector('[data-source-filter="paper"]'),sourceCheckbox);
  assert.equal(doc.querySelector('#pr-filters [data-show-positive="e"]'),graphCheckbox);
  assert.equal(graphCheckbox.getAttribute('aria-pressed'),'false');
  assert.equal(doc.getElementById('source-filter-heading').textContent,'Evidence sources');
  assert.ok(!visible(dom,doc.getElementById('graph-options')));
  assert.ok(visible(dom,doc.getElementById('conjecture-options')));
  assert.ok(!visible(dom,graphCheckbox));
  assert.ok(!visible(dom,doc.querySelector('.pr-category-actions')));
  assert.ok(!visible(dom,doc.getElementById('pr-all')));
  assert.ok(!visible(dom,doc.getElementById('pr-none')));
  assert.ok(visible(dom,doc.querySelector('#pr-filters [data-principle="a"]')));
  assert.ok(visible(dom,doc.querySelector('#pr-filters [data-add-background="a"]')));
  assert.equal(doc.getElementById('open-warning').hidden,true);

  // Recorded conjectures are the questions the records ask, in the lynchpin format: open ones
  // at their rank with scores, settled ones with a status and hidden until Show resolved.
  assert.equal(doc.getElementById('show-resolved').checked,false);
  assert.equal(doc.querySelector('[data-tab="open"]').textContent.trim(),'Conjectures','the tab carries no count');
  assert.equal(doc.getElementById('open-recorded').open,false,'the dropdown starts collapsed');
  assert.equal(doc.querySelector('#open-recorded > summary').textContent.trim(),'Recorded conjectures');
  openSection(dom,'open-recorded');
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b'],'open questions only, in rank order');
  assert.deepEqual([...doc.querySelectorAll('#open-recorded td.rank')].map(td=>td.textContent),['2','7','34']);
  assert.ok(rowOf(dom,'q|a|b').querySelector('.star.iridescent.bronze'),'a conjecture with notes is starred');
  assert.equal(rowOf(dom,'q|b|a').querySelector('.star'),null,'one without notes is not');
  assert.ok(rowOf(dom,'q|a|b').querySelector('details.lynchpin-note button[data-open-result="open-query"]'));
  setResolved(dom,true);
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b','q|a|false','q|a|d','q|a+d|b','q|a+d|false','q|a|c'],'Show resolved adds the settled ones');
  for(const [key,status] of [['q|a|false','consistent'],['q|a|d','excluded'],['q|a+d|b','excluded'],['q|a+d|false','inconsistent'],['q|a|c','proved']]) {
    assert.equal(rowOf(dom,key).dataset.status,status,key);
    assert.equal(rowOf(dom,key).querySelector('.status').textContent,status);
    assert.equal(rowOf(dom,key).querySelector('td.rank').textContent,'—');
  }
  assert.equal(rowOf(dom,'q|a|d').querySelectorAll('details.lynchpin-note').length,0,'records without notes attach silently');
  setResolved(dom,false);
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b']);

  // The share and the list come from the stored evidence, so selecting sources changes neither.
  const progressEl=()=>doc.getElementById('open-progress');
  const settled=progressEl().textContent;
  assert.equal(settled,'14% of questions with up to two premises settled.');
  sourceCheckbox.click();
  assert.equal(progressEl().textContent,settled,'Source filters do not change the settled share');
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b'],'nor the recorded list');
  sourceCheckbox.click();
  doc.getElementById('lean-only').click();
  assert.equal(progressEl().textContent,settled);
  doc.getElementById('lean-only').click();

  const oldWidth=Number(divider.getAttribute('aria-valuenow'));
  divider.dispatchEvent(new dom.window.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
  const newWidth=Number(divider.getAttribute('aria-valuenow'));
  assert.ok(newWidth>oldWidth,'The sidebar divider must work while Conjectures is active.');
  show(dom,'graph');
  assert.ok(doc.getElementById('pane-graph').contains(sidebar));
  assert.ok(doc.getElementById('pane-graph').contains(divider));
  assert.equal(Number(divider.getAttribute('aria-valuenow')),newWidth);
  assert.ok(!visible(dom,doc.getElementById('graph-options')),'the arrow options are set aside for now');
  assert.ok(!visible(dom,doc.getElementById('conjecture-options')));
  assert.ok(visible(dom,graphCheckbox));
  assert.equal(graphCheckbox.getAttribute('aria-pressed'),'false');
  assert.deepEqual(graphMembership(dom),originalGraph);

  // Background changes are shared between the tabs; an ad-hoc background has no stored list.
  show(dom,'open');
  doc.querySelector('#pr-filters [data-add-background="a"]').click();
  assert.deepEqual(assumptions(dom),['a']);
  assert.match(doc.querySelector('#open-recorded .note').textContent,/No list is stored for this background/);
  assert.equal(progressEl().hidden,true);
  show(dom,'graph');
  assert.deepEqual(assumptions(dom),['a']);
  assert.ok(doc.querySelector('#background-list [data-remove-background="a"]'));
  doc.querySelector('#background-list [data-remove-background="a"]').click();
  show(dom,'open');
  assert.deepEqual(assumptions(dom),[]);
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b']);

  // Actual topic: the preserved DTU conjecture keeps its history, and the recorded list
  // under DTU carries the silver-ranked open question at its rank.
  const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
  const historical=['symmetric-dtu-refutes-independent-sum-candidate','conjectured-total-independent-sum-extension','conjectured-dtu-cancellation-implies-preservation'];
  for(const id of historical) {
    const entry=[...data.results,...data.models].find(x=>x.id===id);
    assert.equal(entry.status,'proved');
    assert.equal(entry.was_conjectured,true);
  }
  const real=page(data,'http://localhost/'),rd=real.window.document;
  const du=assumptions(real);
  show(real,'open'); openSection(real,'open-recorded');
  const silver=()=>rd.querySelector('#open-recorded [data-starred="silver"]');
  assert.ok(silver(),'the silver-ranked conjecture is listed under DU');
  assert.equal(silver().dataset.status,'outside','where it has more than two premises');
  assert.ok(keys(real).every(k=>!rowOf(real,k).dataset.status||rowOf(real,k).dataset.status==='outside'),'settled ones wait for Show resolved');
  real.window.addBackgroundPreset('dtu');
  assert.deepEqual(assumptions(real),[...du,'totality'].sort());
  assert.ok(silver(),'under DTU it is a two-premise open question');
  assert.equal(silver().dataset.status,undefined);
  assert.match(silver().querySelector('td.rank').textContent,/^\d+$/,'at its rank');
  assert.ok(silver().querySelector('details.lynchpin-note'),'with its notes');
  assert.ok(visible(real,rd.querySelector('#background-dock [data-background-preset="du"]')));
  assert.ok(visible(real,rd.querySelector('#background-dock [data-background-preset="dtu"]')));
  const shown=keys(real).length;
  setResolved(real,true);
  assert.ok(keys(real).length>shown,'Show resolved adds the settled recorded conjectures');
  setResolved(real,false);

  // Inconsistent backgrounds have their own warning; no explosion is used to
  // silently settle the remaining questions, and removing the cause restores the list.
  rd.querySelector('#pr-filters [data-add-background="archimedean-gambles"]').click();
  assert.equal(rd.getElementById('open-warning').hidden,false);
  rd.querySelector('#background-list [data-remove-background="archimedean-gambles"]').click();
  assert.equal(rd.getElementById('open-warning').hidden,true);
  assert.ok(silver());
  // Hidden inconsistent evidence cannot turn a question into a genuine open
  // question, nor may inconsistency manufacture a proof by explosion.
  sourceCheckbox.click();
  dom.window.changeBackground('a',true);dom.window.changeBackground('d',true);
  assert.equal(doc.getElementById('open-warning').hidden,false);
  assert.match(doc.getElementById('open-warning').textContent,/Additional evidence/);
  assert.match(doc.querySelector('#open-recorded .note').textContent,/inconsistent/);
  assert.equal(progressEl().hidden,true,'no settled share while the full evidence is inconsistent');
  dom.window.resetBackground();sourceCheckbox.click();
  assert.deepEqual(keys(dom),['q|b|false','q|b|a','q|a|b']);
  assert.equal(progressEl().textContent,settled);
  assert.deepEqual(errors,[]);
  console.log('PASS: recorded conjectures in the lynchpin format at their rank or with their status, tiered stars, stable shares under source filters, shared sidebar controls, ad-hoc and incompatible backgrounds, and the DTU conjecture on the real map.');
} finally { pages.forEach(dom=>dom.window.close()); }

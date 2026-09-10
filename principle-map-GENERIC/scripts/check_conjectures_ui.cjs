// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// Rebuild unbounded-utility first; the final checks use its current data.json.
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
function row(dom,id) { return dom.window.document.querySelector(`#open [data-conjecture-id="${id}"]`); }
function resolution(dom,id) { return row(dom,id)?.dataset.resolution; }
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
const fixture={
  topic:{id:'conjectures-fixture',title:'Conjectures fixture',background:[],
    principle_categories:[{id:'basic',name:'Basic principles'}],
    source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'},{id:'submission',name:'A submission',kind:'online-submission'}]},
  principles:['a','b','c','d','e'].map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`,category:'basic'})),
  results:[
    rule('history-result',['a'],'c','proved','paper',true),
    rule('conflict',['a','d'],false,'proved','paper'),
    rule('open-query',['a'],'b'),
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

  // History is explicit metadata. It and current proved/refuted questions are
  // hidden by default, while impossible antecedents have a separate section.
  assert.equal(doc.getElementById('show-resolved').checked,false);
  assert.equal(resolution(dom,'open-query'),'open');
  assert.equal(resolution(dom,'open-model'),'open');
  for(const id of ['history-result','history-model','proved-query','refuted-query','proved-model','refuted-model'])
    assert.equal(row(dom,id),null,id);
  assert.equal(resolution(dom,'incompatible-query'),'incompatible');

  // Open means no answer in the full recorded evidence. Removing a proof or
  // witness only limits the selected evidence; it must not inflate the count.
  const openCount=doc.getElementById('n-open').textContent;
  sourceCheckbox.click();
  assert.equal(resolution(dom,'open-query'),'open');
  assert.equal(resolution(dom,'open-model'),'open');
  for(const [id,status] of [['proved-query','proved'],['refuted-query','refuted'],['proved-model','proved'],['refuted-model','refuted'],['incompatible-query','incompatible'],['history-result','proved'],['history-model','proved']]){
    const question=row(dom,id);
    assert.equal(question.dataset.resolution,'evidence-limited',id);
    assert.equal(question.dataset.selectedResolution,'open',id);
    assert.equal(question.dataset.fullResolution,status,id);
    assert.match(question.querySelector('.resolution').textContent,/Unresolved by selected evidence/);
    assert.match(question.querySelector('.conjecture-evidence summary').textContent,/with all recorded evidence/);
    assert.ok(question.querySelector('[data-open-result],[data-open-model]'),'Omitted evidence stays inspectable');
  }
  assert.equal(doc.getElementById('n-open').textContent,openCount,'Source filters do not inflate the open count');
  assert.ok(row(dom,'refuted-query').querySelector('[data-open-model="history-model"]'),'Refutation still cites an actual countermodel');
  assert.match(row(dom,'incompatible-query').textContent,/does not settle the implication/);
  assert.equal(doc.getElementById('show-resolved').checked,false,'Limited-evidence questions stay visible with Show resolved off');
  sourceCheckbox.click();
  assert.equal(row(dom,'proved-query'),null,'Restoring its evidence hides the resolved question again');
  doc.getElementById('lean-only').click();
  assert.equal(resolution(dom,'proved-query'),'evidence-limited','Lean filters are distinguished from globally open questions too');
  assert.equal(resolution(dom,'open-query'),'open');
  assert.equal(doc.getElementById('n-open').textContent,openCount);
  doc.getElementById('lean-only').click();
  assert.ok(doc.querySelector('#open-incompatible [data-conjecture-id="incompatible-query"]'));
  setResolved(dom,true);
  for(const id of ['history-result','history-model','proved-query','proved-model'])
    assert.equal(resolution(dom,id),'proved',id);
  for(const id of ['refuted-query','refuted-model']) assert.equal(resolution(dom,id),'refuted',id);
  setResolved(dom,false);
  assert.equal(row(dom,'history-result'),null);
  assert.equal(resolution(dom,'incompatible-query'),'incompatible');

  // Turning off the source of a question does not remove that question. Source
  // switches select its evidence, not the existence of the recorded question.
  doc.querySelector('[data-source-filter="submission"]').click();
  assert.equal(resolution(dom,'open-query'),'open');
  doc.querySelector('[data-source-filter="submission"]').click();

  const oldWidth=Number(divider.getAttribute('aria-valuenow'));
  divider.dispatchEvent(new dom.window.KeyboardEvent('keydown',{key:'ArrowRight',bubbles:true}));
  const newWidth=Number(divider.getAttribute('aria-valuenow'));
  assert.ok(newWidth>oldWidth,'The sidebar divider must work while Conjectures is active.');
  show(dom,'graph');
  assert.ok(doc.getElementById('pane-graph').contains(sidebar));
  assert.ok(doc.getElementById('pane-graph').contains(divider));
  assert.equal(Number(divider.getAttribute('aria-valuenow')),newWidth);
  assert.ok(visible(dom,doc.getElementById('graph-options')));
  assert.ok(!visible(dom,doc.getElementById('conjecture-options')));
  assert.ok(visible(dom,graphCheckbox));
  assert.equal(graphCheckbox.getAttribute('aria-pressed'),'false');
  assert.deepEqual(graphMembership(dom),originalGraph);

  // Background changes update model-existence questions and remain shared.
  show(dom,'open');
  setResolved(dom,true);
  doc.querySelector('#pr-filters [data-add-background="a"]').click();
  assert.deepEqual(assumptions(dom),['a']);
  assert.equal(resolution(dom,'open-model'),'refuted');
  show(dom,'graph');
  assert.deepEqual(assumptions(dom),['a']);
  assert.ok(doc.querySelector('#background-list [data-remove-background="a"]'));
  doc.querySelector('#background-list [data-remove-background="a"]').click();
  show(dom,'open');
  assert.equal(resolution(dom,'open-model'),'open');
  assert.deepEqual(assumptions(dom),[]);

  // A countermodel's evidence includes the proof that it fits the selected
  // background, even when the contextual engine takes that background as given.
  doc.querySelector('#pr-filters [data-add-background="c"]').click();
  assert.equal(resolution(dom,'refuted-query'),'refuted');
  assert.ok(row(dom,'refuted-query').querySelector('[data-open-result="history-result"]'),
    'The witness satisfies background C through the recorded A ⇒ C proof.');
  sourceCheckbox.click();
  assert.equal(resolution(dom,'refuted-query'),'evidence-limited');
  assert.ok(row(dom,'refuted-query').querySelector('[data-open-result="history-result"]'),'Full-evidence witness includes its hidden background derivation');
  assert.ok(row(dom,'refuted-query').querySelector('[data-open-model="history-model"]'));
  sourceCheckbox.click();
  doc.querySelector('#background-list [data-remove-background="c"]').click();
  assert.deepEqual(assumptions(dom),[]);

  // Actual topic: historical entries are drawn from explicit recorded history,
  // and a still-open DTU implication can resolve only in a stronger background.
  const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
  const historical=['symmetric-dtu-refutes-independent-sum-candidate','conjectured-total-independent-sum-extension'];
  for(const id of historical) {
    const entry=[...data.results,...data.models].find(x=>x.id===id);
    assert.equal(entry.status,'proved');
    assert.equal(entry.was_conjectured,true);
  }
  const real=page(data,'http://localhost/'),rd=real.window.document;
  const du=assumptions(real),shift='conjectured-dtu-shift-implies-transfer';
  show(real,'open');
  assert.equal(resolution(real,shift),'open');
  for(const id of historical) assert.equal(row(real,id),null);
  setResolved(real,true);
  for(const id of historical) assert.equal(resolution(real,id),'proved');
  setResolved(real,false);
  assert.ok(visible(real,rd.querySelector('#pr-filters [data-background-preset="du"]')));
  assert.ok(visible(real,rd.querySelector('#pr-filters [data-background-preset="dtu"]')));

  rd.querySelector('#pr-filters [data-add-background="l1-continuity"]').click();
  assert.equal(row(real,shift),null,'The now-proved conditional question is hidden until Show resolved is checked.');
  setResolved(real,true);
  assert.equal(resolution(real,shift),'proved');
  assert.deepEqual(assumptions(real),[...du,'l1-continuity'].sort());
  assert.deepEqual(assumptions(page(data,real.window.location.href)),assumptions(real));
  show(real,'graph');
  assert.ok(rd.getElementById('pane-graph').contains(rd.getElementById('graph-sidebar')));
  assert.ok(rd.querySelector('#background-list [data-remove-background="l1-continuity"]'));
  show(real,'open');

  // Hiding the Misc. proof leaves a known resolution outside the selection;
  // it does not turn this question into an open one.
  rd.querySelector('[data-source-filter="misc"]').click();
  assert.equal(resolution(real,shift),'evidence-limited');
  assert.equal(row(real,shift).dataset.fullResolution,'proved');
  rd.querySelector('[data-source-filter="misc"]').click();
  assert.equal(resolution(real,shift),'proved');
  rd.querySelector('#background-list [data-remove-background="l1-continuity"]').click();
  assert.equal(resolution(real,shift),'open');
  assert.deepEqual(assumptions(real),du);

  // Inconsistent backgrounds have their own warning; no explosion is used to
  // silently settle the remaining questions, and removing the cause restores
  // the original background-sensitive open state.
  rd.querySelector('#pr-filters [data-add-background="archimedean-gambles"]').click();
  assert.equal(rd.getElementById('open-warning').hidden,false);
  assert.match(rd.getElementById('open-warning').textContent,/inconsistent/i);
  assert.equal(rd.getElementById('graph-warning').hidden,false);
  rd.querySelector('#background-list [data-remove-background="archimedean-gambles"]').click();
  assert.equal(rd.getElementById('open-warning').hidden,true);
  assert.equal(resolution(real,shift),'open');
  assert.deepEqual(assumptions(real),du);
  // Hidden inconsistent evidence cannot turn a question into a genuine open
  // question, nor may inconsistency manufacture a proof by explosion.
  sourceCheckbox.click();
  dom.window.changeBackground('a',true);dom.window.changeBackground('d',true);
  assert.equal(doc.getElementById('open-warning').hidden,false);
  assert.match(doc.getElementById('open-warning').textContent,/Additional evidence/);
  assert.equal(resolution(dom,'open-query'),'inconsistent-background');
  assert.equal(doc.getElementById('n-open').textContent,'—');
  dom.window.resetBackground();sourceCheckbox.click();
  assert.equal(resolution(dom,'open-query'),'open');
  assert.deepEqual(errors,[]);
  console.log('PASS: open versus evidence-limited conjectures, full-evidence proofs and witnesses, stable open counts, Lean filters, incompatible backgrounds, and shared controls.');
} finally { pages.forEach(dom=>dom.window.close()); }

// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// The Conjectures tab's lynchpin section: lazy, memoised, background-aware,
// skipped for sparse maps, and scored exactly as scripts/pmap.py scores it.
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
function open(dom,value) {
  const det=dom.window.document.getElementById('lynchpins');
  det.open=value; det.dispatchEvent(new dom.window.Event('toggle'));
  return det;
}
function scores(dom,key) {
  const row=dom.window.document.querySelector(`#lynchpins [data-lynchpin="${key}"]`);
  return row && [...row.querySelectorAll('td.num')].map(td=>Number(td.textContent));
}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert('paper'),proof:'Fixture proof.',sources:['Fixture source'],source_names:['Fixture source']});
const model=(id,satisfies,violates)=>({id,name:id.toUpperCase(),satisfies,violates,status:'proved',certificate:cert('paper'),description:'Fixture construction.',sources:['Fixture source'],source_names:['Fixture source']});
const topic={id:'lynchpins-fixture',title:'Lynchpins fixture',background:[],
  principle_categories:[{id:'basic',name:'Basic principles'}],
  source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'}]};
const principles=['p','q','r','s'].map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`,category:'basic'}));
// The selftest topic: p ⇒ q proved, and a model of p violating s. Hand-checked scores live in pmap.py's selftest.
const fixture={topic,principles,results:[rule('pq',['p'],'q')],models:[model('m1',['p'],['s'])]};

try {
  const dom=page(fixture),doc=dom.window.document;
  show(dom,'open');
  const det=()=>doc.getElementById('lynchpins');   // re-fetched: renderAll rebuilds the section
  assert.ok(det(),'the Conjectures tab carries a lynchpin section');
  assert.equal(det().open,false);
  assert.equal(det().querySelector('.lynchpin-body').innerHTML,'','nothing is computed while the section is closed');
  open(dom,true);
  assert.match(det().querySelector('.note').textContent,/Open: 9 implications, 5 joint-consistency questions, 2 consistency questions/);
  assert.deepEqual(scores(dom,'imp|r|p'),[1,1],'r ⇒ p: a proof also gives r ⇒ q; a countermodel shows r consistent');
  assert.deepEqual(scores(dom,'imp|s|p'),[1,1],'a countermodel to s ⇒ p also shows s consistent');
  assert.deepEqual(scores(dom,'con|p|s'),[2,1],'a model of p ∧ s settles q ∧ s and s; excluding it gives s ⇒ ¬p');
  assert.deepEqual(scores(dom,'check|m1|r'),[4,2],'m1 satisfying r settles four questions, violating r two');
  assert.ok(det().querySelector('[data-lynchpin="imp|r|p"] button[data-principle="r"]'),'principles are clickable');
  // The verdict is what the question is about, so there is nothing for a
  // verdict readout to say. The principle reads as it does in the tables above.
  assert.equal(det().querySelector('[data-lynchpin="check|m1|r"] button[data-verdict]'),null,'model checks do not offer an empty verdict');
  const check=det().querySelector('[data-lynchpin="check|m1|r"] button[data-principle="r"]');
  assert.ok(check,'They name the principle the way the other tables do');
  assert.ok(det().querySelector('[data-lynchpin="check|m1|r"] button[data-model="m1"]'),'Beside the model, which still opens');
  check.dispatchEvent(new dom.window.MouseEvent('click',{bubbles:true}));
  const pop=doc.getElementById('pop');
  assert.equal(pop.querySelector('.pop-t').textContent,'R','Clicking it opens the principle itself');
  assert.match(pop.textContent,/Principle r/,'With its statement');
  // With no legend on this tab, the popup carries the one move that still
  // means something here.
  const background=pop.querySelector('[data-selection-action="background"]');
  assert.ok(background,'And offers to assume it');
  assert.ok(pop.querySelector('[data-goto]'),'Alongside its details');
  background.click();
  assert.ok(dom.window.eval('background.has("r")'),'Which puts it in the shared background');
  dom.window.eval('resetBackground()');
  // Memoised per background: the same report object serves again until the background changes.
  const before=dom.window.eval('lynchpinCache.report');
  dom.window.eval('renderAll(false)');
  assert.equal(dom.window.eval('lynchpinCache.report'),before);
  // Closing clears the body; reopening restores it without a recompute.
  open(dom,false);
  assert.equal(det().querySelector('.lynchpin-body').innerHTML,'');
  open(dom,true);
  assert.equal(dom.window.eval('lynchpinCache.report'),before);
  assert.deepEqual(scores(dom,'imp|r|p'),[1,1]);
  // While another tab is shown, a background change is not scored; returning to the tab scores it.
  show(dom,'graph');
  dom.window.eval("background.add('r'); renderAll(false)");
  assert.equal(det().querySelector('.lynchpin-body').innerHTML,'');
  assert.equal(dom.window.eval('lynchpinCache.report'),before);
  show(dom,'open');
  assert.notEqual(dom.window.eval('lynchpinCache.report'),before);
  assert.match(det().querySelector('.note').textContent,/fitting models/);
  assert.equal(doc.querySelector('[data-lynchpin="imp|r|p"] td.stmt').textContent.trim(),'True (⊤) ⇒ P','r now stands for the True class');

  // Under a background the entailed class collapses into True and only models of the background witness.
  const dom2=page(fixture,'http://localhost/?assume=p'),doc2=dom2.window.document;
  show(dom2,'open'); open(dom2,true);
  const det2=doc2.getElementById('lynchpins');
  assert.match(det2.querySelector('.note').textContent,/Open: 3 implications, 1 joint-consistency questions, 2 consistency questions/);
  assert.ok(det2.querySelector('[data-lynchpin="imp|p|r"]'),'p stands for the True class');
  assert.equal(det2.querySelector('[data-lynchpin="imp|q|r"]'),null,'q is in the True class');
  assert.equal(doc2.querySelector('[data-lynchpin="imp|p|r"] td.stmt').textContent.trim(),'True (⊤) ⇒ R');

  // A sparse map is not ranked.
  const dom3=page({topic,principles,results:[],models:[]}),doc3=dom3.window.document;
  show(dom3,'open'); open(dom3,true);
  const det3=doc3.getElementById('lynchpins');
  assert.match(det3.querySelector('.note').textContent,/100% of the implication questions are open/);
  assert.equal(det3.querySelector('table'),null);

  // An inconsistent background reports that instead of scores.
  const dom4=page({topic,principles,results:[rule('pq',['p'],'q'),rule('ps',['p','s'],false)],models:[]},'http://localhost/?assume=p,s'),doc4=dom4.window.document;
  show(dom4,'open'); open(dom4,true);
  assert.match(doc4.getElementById('lynchpins').querySelector('.note').textContent,/inconsistent/);

  assert.deepEqual(errors,[]);
  console.log('PASS: lazy, memoised lynchpin section with hand-checked scores, True class under a background, sparse maps, and inconsistent backgrounds.');
} finally {
  for(const dom of pages) dom.window.close();
}

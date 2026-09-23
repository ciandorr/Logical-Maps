// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// The Conjectures tab: a lynchpin dropdown and a recorded-conjectures dropdown
// in one table format, lazy, background-aware, and rendered from the rankings
// that scripts/pmap.py stores at build time (Lynchpins.rank); nothing is scored here.
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
function open(dom,value,id='lynchpins') {
  const det=dom.window.document.getElementById(id);
  det.open=value; det.dispatchEvent(new dom.window.Event('toggle'));
  return det;
}
function scores(dom,key,id='lynchpins') {
  const row=dom.window.document.querySelector(`#${id} [data-lynchpin="${key}"]`);
  return row && [...row.querySelectorAll('td.num:not(.rank)')].map(td=>td.textContent==='—'?null:Number(td.textContent));
}
function stmt(dom,key,id='lynchpins') { return dom.window.document.querySelector(`#${id} [data-lynchpin="${key}"] td.stmt`).textContent.trim(); }
function keys(dom,id) { return [...dom.window.document.querySelectorAll(`#${id} table.lynchpin tbody tr`)].map(tr=>tr.dataset.lynchpin); }
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert('paper'),proof:'Fixture proof.',sources:['Fixture source'],source_names:['Fixture source']});
const conjecture=(id,premises,conclusion,notes,tier)=>({id,premises,conclusion,status:'conjectured',certificate:cert('paper'),proof:'',notes,...(tier?{tier}:{}),sources:['Fixture source'],source_names:['Fixture source']});
const model=(id,satisfies,violates,status='proved',notes)=>({id,name:id.toUpperCase(),satisfies,violates,status,certificate:cert('paper'),description:'Fixture construction.',...(notes?{notes}:{}),sources:['Fixture source'],source_names:['Fixture source']});
const topic={id:'lynchpins-fixture',title:'Lynchpins fixture',background:[],
  principle_categories:[{id:'basic',name:'Basic principles'}],
  source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'}]};
const principles=['p','q','r','s'].map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`,category:'basic'}));
// The selftest topic: p ⇒ q proved, a model of p violating s, and six recorded conjectures: the results
// q ⊢ r (notes), r ⊢ p (notes, ranked gold by hand), p ⊢ s (already refuted) and p ∧ r ∧ s ⊢ q (more than
// two premises), and the models m3 (q ∧ s; ¬p), claiming q ∧ s ⊬ p and q ∧ s ⊬ ⊥, and m5 (q; ¬s), whose
// claims are already witnessed. The stored shares and rankings are what pmap.py computes for it.
const conjectures=[conjecture('qr',['q'],'r','Try a two-point frame; see the *Notes* field.'),conjecture('rp',['r'],'p','A permutation model might do.','gold'),
  conjecture('ps',['p'],'s','Settled long ago.'),conjecture('prs',['p','r','s'],'q','Three premises.')];
const share=(principles,questions,settled)=>({background:null,name:null,principles,negative:[],premises:2,questions,settled,open:questions-settled});
const q=(premises,conclusion,yes,no)=>({kind:'question',premises,conclusion,yes,no});
const check=(model,principle,yes,no)=>({kind:'check',model,principle,yes,no});
const rec=(id,notes,tier,kind='result')=>({id,kind,notes,tier:tier||null});
const mrec=(id,notes)=>rec(id,notes,null,'model');
const report=(principles,classes,trivial,progress,rows,recorded)=>({background:null,name:null,principles,negative:[],inconsistent_background:false,classes,trivial,fitting_models:['m1'],open:progress.open,progress,rows,recorded});
const rowsNone=[q(['r'],'false',17,0),q(['s'],'false',14,0),q(['q','r'],'false',13,1),q([],'r',11,0),{...q(['q','s'],'false',10,1),claim:'not',tier:'bronze',conjectures:[mrec('m3','A two-point model.')]},q(['r','s'],'q',0,10),q([],'p',10,0),{...q(['q'],'r',9,1),claim:'entails',tier:'bronze',conjectures:[rec('qr','Try a two-point frame; see the *Notes* field.')]},q(['p','r'],'false',8,2),q(['r','s'],'false',8,2),q(['p','s'],'r',0,8),q(['p'],'r',7,2),check('m1','r',6,3),q(['r','s'],'p',1,6)];
rowsNone.forEach((r,i)=>{r.rank=i+1;});
const recordedNone=[rowsNone[4],rowsNone[7],
  {...q(['q','s'],'p',0,5),rank:20,claim:'not',tier:'bronze',conjectures:[mrec('m3','A two-point model.')]},
  {...q(['r'],'p',4,2),rank:22,claim:'entails',tier:'gold',conjectures:[rec('rp','A permutation model might do.','gold')]},
  {kind:'question',premises:['q'],conclusion:'false',rank:null,yes:null,no:null,status:'consistent',claim:'not',verdict:'proved',tier:'bronze',conjectures:[mrec('m5','Two points.')]},
  {kind:'question',premises:['p','r','s'],conclusion:'q',rank:null,yes:null,no:null,status:'outside',claim:'entails',tier:'bronze',conjectures:[rec('prs','Three premises.')]},
  {kind:'question',premises:['p'],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',claim:'entails',verdict:'refuted',tier:'bronze',conjectures:[rec('ps','Settled long ago.')]},
  {kind:'question',premises:['q'],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',claim:'not',verdict:'proved',tier:'bronze',conjectures:[mrec('m5','Two points.')]}];
const rowsP=[q(['r'],'false',4,0),q(['s'],'false',3,0),q([],'r',3,0),q(['r','s'],'false',2,2),check('m1','r',2,1),q(['s'],'r',0,2),q(['r'],'s',1,1)];
rowsP.forEach((r,i)=>{r.rank=i+1;});
rowsP[1]={...rowsP[1],claim:'not',tier:'bronze',conjectures:[mrec('m3','A two-point model.')]};
rowsP[2]={...rowsP[2],claim:'entails',tier:'bronze',conjectures:[rec('qr','Try a two-point frame; see the *Notes* field.')]};
const recordedP=[rowsP[1],rowsP[2],{kind:'question',premises:[],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',claim:'entails',verdict:'refuted',tier:'bronze',conjectures:[rec('ps','Settled long ago.'),mrec('m5','Two points.')]}];
const fixture={topic,principles,results:[rule('pq',['p'],'q'),...conjectures],models:[model('m1',['p'],['s']),model('m3',['q','s'],['p'],'conjectured','A two-point model.'),model('m5',['q'],['s'],'conjectured','Two points.')],
  progress:[share([],33,6),share(['p'],7,1)],
  lynchpins:{skipped:null,reports:[
    report([],[['p'],['q'],['r'],['s']],[],share([],33,6),rowsNone,recordedNone),
    report(['p'],[['p','q'],['r'],['s']],['p','q'],share(['p'],7,1),rowsP,recordedP)]}};

try {
  const dom=page(fixture),doc=dom.window.document;
  const det=()=>doc.getElementById('lynchpins');   // re-fetched: renderAll rebuilds the section
  const recorded=()=>doc.getElementById('open-recorded');
  const progress=()=>doc.getElementById('open-progress');
  const body=(id='lynchpins')=>doc.getElementById(id).querySelector('.lynchpin-body');
  assert.equal(progress().hidden,true,'no settled share while another tab is shown');
  assert.ok(det(),'the Conjectures tab carries a lynchpin section');
  assert.equal(det().open,false,'the section starts collapsed');
  assert.equal(body().innerHTML,'','nothing is rendered while the section is closed');
  assert.equal(det().querySelector('.hint').textContent,'Open questions ranked by how many other open questions each answer would settle.');
  // Two peer dropdowns in one format: lynchpins first, then the recorded conjectures, both collapsed at first.
  assert.ok(det().compareDocumentPosition(recorded())&dom.window.Node.DOCUMENT_POSITION_FOLLOWING,'lynchpins precede the recorded questions');
  assert.equal(recorded().open,false);
  assert.equal(det().querySelector('summary').textContent.trim(),'Central Questions');
  assert.equal(recorded().querySelector('summary').textContent.trim(),'Conjectures','no count on the dropdown');
  assert.equal(body('open-recorded').innerHTML,'','nothing is rendered while it is closed');
  show(dom,'open');
  assert.equal(body().innerHTML,'','still nothing while the section is closed');
  assert.equal(progress().hidden,false);
  assert.equal(progress().textContent,'18% of questions with up to two premises settled.');
  assert.match(progress().title,/^6 of 33 questions/);
  open(dom,true);
  assert.equal(det().querySelector('.note'),null,'no count summary above the table');
  assert.equal(det().querySelectorAll('table.lynchpin').length,1,'one list: implications, consistency and model checks are not split');
  assert.equal(keys(dom,'lynchpins').length,rowsNone.length,'the ranking shows its stored top and nothing carried from below it');
  assert.deepEqual(keys(dom,'lynchpins').slice(0,4),['q|r|false','q|s|false','q|q+r|false','q||r'],'in stored order: consistency, theorem and implication questions together');
  assert.deepEqual(scores(dom,'q|r|false'),[17,0],'r ⊢ ⊥: excluding r settles every question about it');
  assert.deepEqual(scores(dom,'q||r'),[11,0],'⊤ ⊢ r: a theorem question has no premises');
  assert.deepEqual(scores(dom,'q|r+s|q'),[0,10],'r ∧ s ⊢ q: a two-premise question');
  assert.deepEqual(scores(dom,'check|m1|r'),[6,3],'a model check sits in the same list');
  assert.equal(stmt(dom,'q|r|false'),'R ⊢ False (⊥)','a turnstile: no denies the entailment, not the conditional');
  assert.equal(stmt(dom,'q||r'),'True (⊤) ⊢ R');
  assert.equal(stmt(dom,'q|r+s|q'),'R ∧ S ⊢ Q');
  assert.equal(stmt(dom,'check|m1|r'),'M1: R');
  assert.deepEqual([...det().querySelectorAll('tbody tr td.rank')].map(td=>td.textContent).slice(0,3),['1','2','3'],'every row shows its rank');
  assert.ok(det().querySelector('[data-lynchpin="q|r+s|q"] button[data-principle="r"]'),'principles are clickable');
  // A row that a recorded conjecture asks about is starred here too, with the record's notes.
  const starred=det().querySelector('[data-lynchpin="q|q|r"]');
  assert.equal(starred.dataset.starred,'bronze'); assert.ok(starred.querySelector('.star.iridescent.bronze'),'notes alone earn a bronze star');
  assert.equal(starred.querySelector('details'),null,'no dropdown of notes');
  assert.equal(starred.querySelector('.links button[data-open-result="qr"]').textContent,'details','just a link to the record');
  assert.equal(det().querySelectorAll('[data-starred]').length,2,'rows without a noted conjecture carry no star');
  assert.equal(stmt(dom,'q|q+s|false'),'★Q ∧ S ⊢ False (⊥) details','a central question reads as a question whatever a record claims');
  assert.deepEqual(scores(dom,'q|q+s|false'),[10,1]);
  assert.equal(det().querySelector('[data-lynchpin="q|r|p"]'),null,'a question ranked below the stored top is not a lynchpin');
  // The verdict is what the question is about, so there is nothing for a
  // verdict readout to say. The principle reads as it does in the tables above.
  assert.equal(det().querySelector('[data-lynchpin="check|m1|r"] button[data-verdict]'),null,'model checks do not offer an empty verdict');
  const checkButton=det().querySelector('[data-lynchpin="check|m1|r"] button[data-principle="r"]');
  assert.ok(checkButton,'They name the principle the way the other rows do');
  assert.ok(det().querySelector('[data-lynchpin="check|m1|r"] button[data-model="m1"]'),'Beside the model, which still opens');
  checkButton.dispatchEvent(new dom.window.MouseEvent('click',{bubbles:true}));
  const pop=doc.getElementById('pop');
  assert.equal(pop.querySelector('.pop-t').textContent,'R','Clicking it opens the principle itself');
  assert.match(pop.textContent,/Principle r/,'With its statement');
  const background=pop.querySelector('[data-selection-action="background"]');
  assert.ok(background,'And offers to assume it');
  assert.ok(pop.querySelector('[data-goto]'),'Alongside its details');
  background.click();
  assert.ok(dom.window.eval('background.has("r")'),'Which puts it in the shared background');
  dom.window.eval('resetBackground()');

  // Recorded conjectures: the questions the records ask, in the same table. Open ones sit at
  // their rank with scores, wherever they rank; settled ones are hidden until Show resolved.
  open(dom,true,'open-recorded');
  assert.equal(recorded().querySelectorAll('table.lynchpin').length,1,'the same format as the lynchpins');
  assert.deepEqual(keys(dom,'open-recorded'),['q|q+s|false','q|q|r','q|q+s|p','q|r|p','q|p+r+s|q'],'open conjectures first, in rank order, then one with more than two premises; settled ones wait for Show resolved');
  assert.deepEqual(scores(dom,'q|r|p','open-recorded'),[4,2]);
  // A model conjectures against the entailment: it reads with ⊬ and its scores are what confirming or refuting it settles.
  assert.equal(stmt(dom,'q|q+s|p','open-recorded'),'★Q ∧ S ⊬ P details');
  assert.deepEqual(scores(dom,'q|q+s|p','open-recorded'),[5,0],'flipped from the question\'s 0 / 5');
  assert.equal(recorded().querySelector('[data-lynchpin="q|q+s|p"]').dataset.claim,'not');
  assert.equal(stmt(dom,'q|q+s|false','open-recorded'),'★Q ∧ S ⊬ False (⊥) details'); assert.deepEqual(scores(dom,'q|q+s|false','open-recorded'),[1,10]);
  assert.equal(stmt(dom,'q|q|r','open-recorded'),'★Q ⊢ R details','a result claims the entailment');
  assert.equal(recorded().querySelector('th:nth-child(2)').textContent,'Conjecture');
  assert.equal(recorded().querySelector('[data-lynchpin="q|r|p"] td.rank').textContent,'22','a question below the stored top shows its true rank');
  assert.ok(recorded().querySelector('[data-lynchpin="q|r|p"] .star.iridescent.gold'),'a record ranked gold by hand shows a gold star');
  assert.match(recorded().querySelector('[data-lynchpin="q|r|p"] .star').title,/^gold: /);
  assert.equal(recorded().querySelector('[data-lynchpin="q|r|p"] .links button[data-open-result="rp"]').title,'rp');
  const outside=recorded().querySelector('[data-lynchpin="q|p+r+s|q"]');
  assert.equal(outside.dataset.status,'outside'); assert.equal(outside.querySelector('td.rank').textContent,'—');
  assert.deepEqual(scores(dom,'q|p+r+s|q','open-recorded'),[null,null]);
  assert.equal(outside.querySelector('.status').textContent,'more than two premises');
  assert.equal(stmt(dom,'q|p+r+s|q','open-recorded').replace(/\s+/g,' '),'★P ∧ R ∧ S ⊢ Q more than two premises details');
  doc.getElementById('show-resolved').click();
  assert.deepEqual(keys(dom,'open-recorded'),['q|q+s|false','q|q|r','q|q+s|p','q|r|p','q|q|false','q|p+r+s|q','q|p|s','q|q|s'],'Show resolved adds the settled conjectures');
  const settled=recorded().querySelector('[data-lynchpin="q|p|s"]');
  assert.equal(settled.dataset.status,'refuted'); assert.equal(settled.querySelector('.status').textContent,'refuted','a result conjecture whose entailment is refuted is refuted');
  assert.deepEqual(scores(dom,'q|p|s','open-recorded'),[null,null]); assert.equal(settled.querySelector('td.rank').textContent,'—');
  const witnessed=recorded().querySelector('[data-lynchpin="q|q|s"]');
  assert.equal(witnessed.dataset.status,'refuted'); assert.equal(witnessed.querySelector('.status').textContent,'proved','a model conjecture whose entailment is refuted is proved');
  assert.equal(stmt(dom,'q|q|s','open-recorded'),'★Q ⊬ S proved details');
  assert.equal(recorded().querySelector('[data-lynchpin="q|q|false"] .status').textContent,'proved','a witnessed consistency claim is proved');
  doc.getElementById('show-resolved').click();
  assert.equal(recorded().querySelector('[data-lynchpin="q|p|s"]'),null);
  // Each dropdown remembers its state across a re-render.
  dom.window.eval('renderAll(false)');
  assert.equal(recorded().open,true,'opening the recorded questions survives a re-render');
  assert.equal(det().open,true);
  assert.deepEqual(scores(dom,'q|r|false'),[17,0],'the table survives a re-render');
  assert.deepEqual(keys(dom,'open-recorded'),['q|q+s|false','q|q|r','q|q+s|p','q|r|p','q|p+r+s|q']);
  open(dom,false,'open-recorded');
  assert.equal(body('open-recorded').innerHTML,'','closing clears the body');
  // Closing clears the body; reopening restores it.
  open(dom,false);
  assert.equal(body().innerHTML,'');
  dom.window.eval('renderAll(false)');
  assert.equal(det().open,false,'a closed lynchpin section stays closed across a re-render');
  assert.equal(body().innerHTML,'');
  open(dom,true);
  assert.deepEqual(scores(dom,'q|r|false'),[17,0]);
  // An ad-hoc background has no stored ranking, list or share; nothing is computed for it.
  show(dom,'graph');
  dom.window.eval("background.add('r'); renderAll(false)");
  assert.equal(body().innerHTML,'','nothing is rendered while another tab is shown');
  show(dom,'open'); open(dom,true,'open-recorded');
  assert.match(body().textContent,/No ranking is stored for this background/);
  assert.match(body('open-recorded').textContent,/No list is stored for this background/);
  assert.equal(det().querySelector('table'),null);
  assert.equal(progress().hidden,true,'no stored share for an ad-hoc background');
  det().querySelector('[data-lynchpin-reset]').click();
  assert.equal(keys(dom,'lynchpins').length,rowsNone.length,'clearing the background from the note restores the stored ranking');
  assert.deepEqual(keys(dom,'open-recorded'),['q|q+s|false','q|q|r','q|q+s|p','q|r|p','q|p+r+s|q'],'and the conjectures');
  assert.equal(progress().hidden,false);

  // Under a stored preset background the entailed class collapses into True.
  const dom2=page(fixture,'http://localhost/?assume=p'),doc2=dom2.window.document;
  show(dom2,'open'); open(dom2,true); open(dom2,true,'open-recorded');
  const det2=doc2.getElementById('lynchpins');
  assert.equal(doc2.getElementById('open-progress').textContent,'14% of questions with up to two premises settled.','the stored share for the p background');
  assert.equal(det2.querySelectorAll('tbody tr').length,rowsP.length);
  assert.ok(stmt(dom2,'q||r').replace(/^★/,'').startsWith('True (⊤) ⊢ R'),'q ⊢ r reads as ⊤ ⊢ r under p, starred');
  assert.equal(det2.querySelector('[data-lynchpin="q|q|r"]'),null,'q is in the True class and asks nothing');
  assert.deepEqual(scores(dom2,'q|r+s|false'),[2,2]);
  assert.deepEqual(keys(dom2,'open-recorded'),['q|s|false','q||r'],'q ⊢ r becomes ⊤ ⊢ r under p; p ⊢ s is settled');
  assert.equal(stmt(dom2,'q|s|false','open-recorded'),'★S ⊬ False (⊥) details'); assert.deepEqual(scores(dom2,'q|s|false','open-recorded'),[0,3]);

  // A sparse map is not ranked, but its recorded conjectures are still listed and scored.
  const sparseReport=report([],[['p'],['q'],['r'],['s']],[],share([],38,0),[],[{...q(['q'],'r',2,2),rank:null,tier:'bronze',conjectures:[rec('qr','Try a two-point frame; see the *Notes* field.')]}]);
  const dom3=page({topic,principles,results:[conjectures[0]],models:[],progress:[share([],38,0)],lynchpins:{skipped:'100% of the questions are open',reports:[sparseReport]}}),doc3=dom3.window.document;
  show(dom3,'open'); open(dom3,true); open(dom3,true,'open-recorded');
  const det3=doc3.getElementById('lynchpins');
  assert.match(det3.querySelector('.note').textContent,/Too few questions are settled/);
  assert.equal(det3.querySelector('table'),null);
  assert.deepEqual(keys(dom3,'open-recorded'),['q|q|r']);
  assert.deepEqual(scores(dom3,'q|q|r','open-recorded'),[2,2]);
  assert.equal(doc3.querySelector('#open-recorded [data-lynchpin="q|q|r"] td.rank').textContent,'—','unranked on a sparse map');
  assert.equal(doc3.getElementById('open-progress').textContent,'0% of questions with up to two premises settled.');

  // An inconsistent background reports that instead of scores.
  const dom4=page({topic,principles,results:[rule('pq',['p'],'q'),rule('ps',['p','s'],false)],models:[]},'http://localhost/?assume=p,s'),doc4=dom4.window.document;
  show(dom4,'open'); open(dom4,true); open(dom4,true,'open-recorded');
  assert.match(doc4.getElementById('lynchpins').querySelector('.note').textContent,/inconsistent/);
  assert.match(doc4.getElementById('open-recorded').querySelector('.note').textContent,/inconsistent/);
  assert.equal(doc4.getElementById('open-progress').hidden,true,'no settled share under an inconsistent background');

  assert.deepEqual(errors,[]);
  console.log('PASS: settled share, Central Questions and Conjectures in one format (a conjecture in its record\'s direction with flipped scores, at its rank while open, with its verdict once settled, marked beyond two premises), tiered stars with a details link, collapsed and lazy, True class under a stored background, none for an ad-hoc background, sparse maps, and inconsistent backgrounds.');
} finally {
  for(const dom of pages) dom.window.close();
}

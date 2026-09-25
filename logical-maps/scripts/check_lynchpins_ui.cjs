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
const report=(principles,classes,trivial,progress,rows,auto,recorded)=>({background:null,name:null,principles,negative:[],inconsistent_background:false,classes,trivial,fitting_models:['m1'],open:progress.open,progress,rows,auto,recorded});
// pmap.py's stored rankings for this fixture: the central questions by the harmonic mean of
// if yes and if no, the automatically generated conjectures by the larger side (each stated as
// the answer to expect), and the recorded conjectures at their central rank.
const row=(o)=>({kind:'question',...o});
const chk=(model,principle,o)=>({kind:'check',model,principle,...o});
const qr=[rec('qr','Try a two-point frame; see the *Notes* field.')], rp=[rec('rp','A permutation model might do.','gold')], m3=[mrec('m3','A two-point model.')], m5=[mrec('m5','Two points.')];
const rowsNone=[chk('m1','r',{yes:6,no:3,score:4,auto_rank:13,auto_claim:'not',rank:1}),
  row({premises:['p','r'],conclusion:'s',yes:3,no:5,score:3.8,auto_rank:15,auto_claim:'entails',rank:2}),
  row({premises:['q','r'],conclusion:'s',yes:4,no:3,score:3.4,auto_rank:21,auto_claim:'not',rank:3}),
  row({premises:['p','r'],conclusion:'false',yes:8,no:2,score:3.2,auto_rank:9,auto_claim:'not',rank:4}),
  row({premises:['r','s'],conclusion:'false',yes:8,no:2,score:3.2,auto_rank:10,auto_claim:'not',rank:5}),
  row({premises:['p'],conclusion:'r',yes:7,no:2,score:3.1,auto_rank:12,auto_claim:'not',rank:6}),
  row({premises:['p','s'],conclusion:'false',yes:5,no:2,score:2.9,auto_rank:16,auto_claim:'not',rank:7}),
  row({premises:['r'],conclusion:'p',yes:4,no:2,score:2.7,auto_rank:22,auto_claim:'not',rank:8,conjectures:rp,claim:'entails',tier:'gold'}),
  row({premises:['s'],conclusion:'p',yes:4,no:2,score:2.7,auto_rank:23,auto_claim:'not',rank:9}),
  row({premises:['s'],conclusion:'r',yes:2,no:2,score:2,auto_rank:27,auto_claim:'entails',rank:10}),
  row({premises:['q','r'],conclusion:'false',yes:13,no:1,score:1.9,auto_rank:3,auto_claim:'not',rank:11}),
  row({premises:['q','s'],conclusion:'false',yes:10,no:1,score:1.8,auto_rank:5,auto_claim:'not',rank:12,conjectures:m3,claim:'not',tier:'bronze'}),
  row({premises:['q'],conclusion:'r',yes:9,no:1,score:1.8,auto_rank:8,auto_claim:'not',rank:13,conjectures:qr,claim:'entails',tier:'bronze'}),
  row({premises:['r','s'],conclusion:'p',yes:1,no:6,score:1.7,auto_rank:14,auto_claim:'entails',rank:14})];
const autoNone=[row({premises:['r'],conclusion:'false',yes:17,no:0,score:0,auto_rank:1,auto_claim:'not',rank:21}),
  row({premises:['s'],conclusion:'false',yes:14,no:0,score:0,auto_rank:2,auto_claim:'not',rank:22}),
  rowsNone[10],row({premises:[],conclusion:'r',yes:11,no:0,score:0,auto_rank:4,auto_claim:'not',rank:23}),rowsNone[11],
  row({premises:['r','s'],conclusion:'q',yes:0,no:10,score:0,auto_rank:6,auto_claim:'entails',rank:24}),
  row({premises:[],conclusion:'p',yes:10,no:0,score:0,auto_rank:7,auto_claim:'not',rank:25}),rowsNone[12],rowsNone[3],rowsNone[4],
  row({premises:['p','s'],conclusion:'r',yes:0,no:8,score:0,auto_rank:11,auto_claim:'entails',rank:26}),rowsNone[5],rowsNone[0],rowsNone[13]];
const recordedNone=[rowsNone[7],rowsNone[11],rowsNone[12],
  row({premises:['q','s'],conclusion:'p',yes:0,no:5,score:0,auto_rank:20,auto_claim:'entails',rank:28,conjectures:m3,claim:'not',tier:'bronze'}),
  row({premises:['q'],conclusion:'false',rank:null,yes:null,no:null,status:'consistent',conjectures:m5,claim:'not',tier:'bronze',verdict:'proved'}),
  row({premises:['p','r','s'],conclusion:'q',rank:null,yes:null,no:null,status:'outside',conjectures:[rec('prs','Three premises.')],claim:'entails',tier:'bronze'}),
  row({premises:['p'],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',conjectures:[rec('ps','Settled long ago.')],claim:'entails',tier:'bronze',verdict:'refuted'}),
  row({premises:['q'],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',conjectures:m5,claim:'not',tier:'bronze',verdict:'proved'})];
const rowsP=[row({premises:['r','s'],conclusion:'false',yes:2,no:2,score:2,auto_rank:4,auto_claim:'entails',rank:1}),chk('m1','r',{yes:2,no:1,score:1.3,auto_rank:5,auto_claim:'not',rank:2}),
  row({premises:['r'],conclusion:'s',yes:1,no:1,score:1,auto_rank:7,auto_claim:'entails',rank:3}),row({premises:['r'],conclusion:'false',yes:4,no:0,score:0,auto_rank:1,auto_claim:'not',rank:4}),
  row({premises:['s'],conclusion:'false',yes:3,no:0,score:0,auto_rank:2,auto_claim:'not',rank:5,conjectures:m3,claim:'not',tier:'bronze'}),
  row({premises:[],conclusion:'r',yes:3,no:0,score:0,auto_rank:3,auto_claim:'not',rank:6,conjectures:qr,claim:'entails',tier:'bronze'}),
  row({premises:['s'],conclusion:'r',yes:0,no:2,score:0,auto_rank:6,auto_claim:'entails',rank:7})];
const autoP=[rowsP[3],rowsP[4],rowsP[5],rowsP[0],rowsP[1],rowsP[6],rowsP[2]];
const recordedP=[rowsP[4],rowsP[5],row({premises:[],conclusion:'s',rank:null,yes:null,no:null,status:'refuted',conjectures:[rec('ps','Settled long ago.'),mrec('m5','Two points.')],claim:'entails',tier:'bronze',verdict:'refuted'})];
const fixture={topic,principles,results:[rule('pq',['p'],'q'),...conjectures],models:[model('m1',['p'],['s']),model('m3',['q','s'],['p'],'conjectured','A two-point model.'),model('m5',['q'],['s'],'conjectured','Two points.')],
  progress:[share([],33,6),share(['p'],7,1)],
  lynchpins:{skipped:null,reports:[
    report([],[['p'],['q'],['r'],['s']],[],share([],33,6),rowsNone,autoNone,recordedNone),
    report(['p'],[['p','q'],['r'],['s']],['p','q'],share(['p'],7,1),rowsP,autoP,recordedP)]}};

try {
  const dom=page(fixture),doc=dom.window.document;
  const det=()=>doc.getElementById('lynchpins');   // re-fetched: renderAll rebuilds the section
  const auto=()=>doc.getElementById('open-auto');
  const recorded=()=>doc.getElementById('open-recorded');
  const progress=()=>doc.getElementById('open-progress');
  const body=(id='lynchpins')=>doc.getElementById(id).querySelector('.lynchpin-body');
  assert.equal(progress().hidden,true,'no settled share while another tab is shown');
  assert.ok(det(),'the Conjectures tab carries a central-questions section');
  assert.equal(det().open,false,'the section starts collapsed');
  assert.equal(body().innerHTML,'','nothing is rendered while the section is closed');
  assert.ok(det().querySelector('.hint').textContent.startsWith('Open questions ranked by how much both answers would settle'));
  assert.ok(det().querySelector('.hint').contains(progress()),'the settled share sits in the description');
  // Three peer dropdowns in one format, all collapsed at first.
  assert.equal(det().querySelector('summary').textContent.trim(),'Central Questions');
  assert.equal(auto().querySelector('summary').textContent.trim(),'Automatically Generated Conjectures');
  assert.equal(recorded().querySelector('summary').textContent.trim(),'Conjectures','no count on the dropdown');
  assert.ok(det().compareDocumentPosition(recorded())&dom.window.Node.DOCUMENT_POSITION_FOLLOWING,'central questions, then the conjectures');
  assert.ok(recorded().compareDocumentPosition(auto())&dom.window.Node.DOCUMENT_POSITION_FOLLOWING,'then the generated ones');
  assert.equal(recorded().open,false); assert.equal(auto().open,false);
  assert.equal(body('open-recorded').innerHTML,''); assert.equal(body('open-auto').innerHTML,'');
  show(dom,'open');
  assert.equal(body().innerHTML,'','still nothing while the section is closed');
  assert.equal(progress().hidden,false);
  assert.equal(progress().textContent,'18% of 33 questions with up to two premises are settled.');
  assert.match(progress().title,/^6 of 33 questions/);

  // Central questions: by the harmonic mean, so a one-sided question sinks and a balanced one leads.
  open(dom,true);
  assert.equal(det().querySelector('.note'),null,'no count summary above the table');
  assert.equal(det().querySelectorAll('table.lynchpin').length,1,'one list: implications, consistency and model checks are not split');
  assert.equal(keys(dom,'lynchpins').length,rowsNone.length,'the stored top and nothing else');
  assert.deepEqual(keys(dom,'lynchpins').slice(0,4),['check|m1|r','q|p+r|s','q|q+r|s','q|p+r|false'],'m1: r at 6 / 3 leads; r ⊢ ⊥ at 17 / 0 is nowhere near');
  assert.equal(keys(dom,'lynchpins').includes('q|r|false'),false);
  assert.deepEqual(scores(dom,'check|m1|r'),[6,3],'a model check sits in the same list');
  assert.deepEqual(scores(dom,'q|p+r|s'),[3,5]);
  assert.equal(stmt(dom,'q|p+r|false'),'P ∧ R ⊢ False (⊥)','a turnstile: no denies the entailment, not the conditional');
  assert.equal(stmt(dom,'check|m1|r'),'M1: R');
  assert.deepEqual([...det().querySelectorAll('tbody tr td.rank')].map(td=>td.textContent).slice(0,3),['1','2','3'],'every row shows its rank');
  assert.equal(det().querySelector('th.num').textContent,'Rank');
  assert.ok(det().querySelector('[data-lynchpin="q|q+r|s"] button[data-principle="r"]'),'principles are clickable');
  // A row that a recorded conjecture asks about is starred here too, with a link to the record.
  const starred=det().querySelector('[data-lynchpin="q|q|r"]');
  assert.equal(starred.dataset.starred,'bronze'); assert.ok(starred.querySelector('.star.iridescent.bronze'),'notes alone earn a bronze star');
  assert.equal(starred.querySelector('details'),null,'no dropdown of notes');
  assert.equal(starred.querySelector('.links button[data-open-result="qr"]').textContent,'details','just a link to the record');
  assert.equal(det().querySelectorAll('[data-starred]').length,3,'rows without a noted conjecture carry no star');
  assert.ok(det().querySelector('[data-lynchpin="q|r|p"] .star.iridescent.gold'),'a record ranked gold by hand shows a gold star');
  assert.match(det().querySelector('[data-lynchpin="q|r|p"] .star').title,/^gold: /);
  assert.equal(stmt(dom,'q|q+s|false'),'★Q ∧ S ⊢ False (⊥) details','a central question reads as a question whatever a record claims');
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

  // Automatically generated conjectures: the same questions by their larger side, each stated as
  // the answer to expect, with the scores turned to what confirming or refuting it would settle.
  open(dom,true,'open-auto');
  assert.equal(auto().querySelectorAll('table.lynchpin').length,1);
  assert.deepEqual(keys(dom,'open-auto').slice(0,4),['q|r|false','q|s|false','q|q+r|false','q||r'],'by the larger side');
  assert.deepEqual([...auto().querySelectorAll('tbody tr td.rank')].map(td=>td.textContent).slice(0,3),['1','2','3'],'with its own rank');
  assert.equal(auto().querySelector('th.num').textContent,'“If no” rank','a different ranking, labelled as one');
  assert.equal(stmt(dom,'q|r|false','open-auto'),'R ⊬ False (⊥)','a proof of r ⊢ ⊥ would settle 17, a refutation none: expect the refutation');
  assert.deepEqual(scores(dom,'q|r|false','open-auto'),[0,17],'if yes: confirming r ⊬ ⊥; if no: the surprise');
  assert.equal(auto().querySelector('[data-lynchpin="q|r|false"]').dataset.claim,'not');
  assert.equal(stmt(dom,'q|r+s|q','open-auto'),'R ∧ S ⊢ Q','a refutation would settle 10, a proof none: expect the proof');
  assert.deepEqual(scores(dom,'q|r+s|q','open-auto'),[0,10]);
  assert.equal(auto().querySelector('th:nth-child(2)').textContent,'Conjecture');
  assert.ok(auto().querySelector('[data-lynchpin="q|q|r"] .star.iridescent.bronze'),'starred here too');

  // Conjectures: the questions the records ask, in the same table, at their central rank. Open
  // ones sit at their rank with scores; settled ones are hidden until Show resolved.
  open(dom,true,'open-recorded');
  assert.equal(recorded().querySelectorAll('table.lynchpin').length,1,'the same format as the central questions');
  assert.deepEqual(keys(dom,'open-recorded'),['q|r|p','q|q+s|false','q|q|r','q|q+s|p','q|p+r+s|q'],'open conjectures first, in rank order, then one with more than two premises; settled ones wait for Show resolved');
  assert.deepEqual([...recorded().querySelectorAll('tbody tr td.rank')].map(td=>td.textContent),['8','12','13','28','—'],'central ranks, wherever they fall');
  assert.deepEqual(scores(dom,'q|r|p','open-recorded'),[4,2]);
  // A model conjectures against the entailment: it reads with ⊬ and its scores are what confirming or refuting it settles.
  assert.equal(stmt(dom,'q|q+s|p','open-recorded'),'★Q ∧ S ⊬ P details');
  assert.deepEqual(scores(dom,'q|q+s|p','open-recorded'),[5,0],'flipped from the question\'s 0 / 5');
  assert.equal(recorded().querySelector('[data-lynchpin="q|q+s|p"]').dataset.claim,'not');
  assert.equal(stmt(dom,'q|q+s|false','open-recorded'),'★Q ∧ S ⊬ False (⊥) details'); assert.deepEqual(scores(dom,'q|q+s|false','open-recorded'),[1,10]);
  assert.equal(stmt(dom,'q|q|r','open-recorded'),'★Q ⊢ R details','a result claims the entailment');
  assert.equal(recorded().querySelector('th:nth-child(2)').textContent,'Conjecture');
  assert.ok(recorded().querySelector('[data-lynchpin="q|r|p"] .star.iridescent.gold'),'a record ranked gold by hand shows a gold star');
  assert.equal(recorded().querySelector('[data-lynchpin="q|r|p"] .links button[data-open-result="rp"]').title,'rp');
  const outside=recorded().querySelector('[data-lynchpin="q|p+r+s|q"]');
  assert.equal(outside.dataset.status,'outside'); assert.equal(outside.querySelector('td.rank').textContent,'—');
  assert.deepEqual(scores(dom,'q|p+r+s|q','open-recorded'),[null,null]);
  assert.equal(outside.querySelector('.status').textContent,'more than two premises');
  assert.equal(stmt(dom,'q|p+r+s|q','open-recorded').replace(/\s+/g,' '),'★P ∧ R ∧ S ⊢ Q more than two premises details');
  doc.getElementById('show-resolved').click();
  assert.deepEqual(keys(dom,'open-recorded'),['q|r|p','q|q+s|false','q|q|r','q|q+s|p','q|q|false','q|p+r+s|q','q|p|s','q|q|s'],'Show resolved adds the settled conjectures');
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
  assert.equal(recorded().open,true,'opening the conjectures survives a re-render');
  assert.equal(det().open,true); assert.equal(auto().open,true);
  assert.deepEqual(scores(dom,'check|m1|r'),[6,3],'the table survives a re-render');
  assert.deepEqual(keys(dom,'open-recorded'),['q|r|p','q|q+s|false','q|q|r','q|q+s|p','q|p+r+s|q']);
  open(dom,false,'open-recorded'); open(dom,false,'open-auto');
  assert.equal(body('open-recorded').innerHTML,'','closing clears the body'); assert.equal(body('open-auto').innerHTML,'');
  // Closing clears the body; reopening restores it.
  open(dom,false);
  assert.equal(body().innerHTML,'');
  dom.window.eval('renderAll(false)');
  assert.equal(det().open,false,'a closed section stays closed across a re-render');
  assert.equal(body().innerHTML,'');
  open(dom,true);
  assert.deepEqual(scores(dom,'check|m1|r'),[6,3]);
  // An ad-hoc background has no stored ranking, list or share; nothing is computed for it.
  show(dom,'graph');
  dom.window.eval("background.add('r'); renderAll(false)");
  assert.equal(body().innerHTML,'','nothing is rendered while another tab is shown');
  show(dom,'open'); open(dom,true,'open-auto'); open(dom,true,'open-recorded');
  assert.match(body().textContent,/No ranking is stored for this background/);
  assert.match(body('open-auto').textContent,/No ranking is stored for this background/);
  assert.match(body('open-recorded').textContent,/No list is stored for this background/);
  assert.equal(det().querySelector('table'),null);
  assert.equal(progress().hidden,true,'no stored share for an ad-hoc background');
  det().querySelector('[data-lynchpin-reset]').click();
  assert.equal(keys(dom,'lynchpins').length,rowsNone.length,'clearing the background from the note restores the stored ranking');
  assert.equal(keys(dom,'open-auto').length,autoNone.length,'the generated conjectures');
  assert.deepEqual(keys(dom,'open-recorded'),['q|r|p','q|q+s|false','q|q|r','q|q+s|p','q|p+r+s|q'],'and the conjectures');
  assert.equal(progress().hidden,false);

  // Under a stored preset background the entailed class collapses into True.
  const dom2=page(fixture,'http://localhost/?assume=p'),doc2=dom2.window.document;
  show(dom2,'open'); open(dom2,true); open(dom2,true,'open-auto'); open(dom2,true,'open-recorded');
  const det2=doc2.getElementById('lynchpins');
  assert.equal(doc2.getElementById('open-progress').textContent,'14% of 7 questions with up to two premises are settled.','the stored share for the p background');
  assert.equal(det2.querySelectorAll('tbody tr').length,rowsP.length);
  assert.deepEqual(keys(dom2,'lynchpins').slice(0,2),['q|r+s|false','check|m1|r'],'r ∧ s ⊢ ⊥ at 2 / 2 leads under p');
  assert.ok(stmt(dom2,'q||r').replace(/^★/,'').startsWith('True (⊤) ⊢ R'),'q ⊢ r reads as ⊤ ⊢ r under p, starred');
  assert.equal(det2.querySelector('[data-lynchpin="q|q|r"]'),null,'q is in the True class and asks nothing');
  assert.deepEqual(scores(dom2,'q|r+s|false'),[2,2]);
  assert.equal(stmt(dom2,'q||r','open-auto'),'★True (⊤) ⊬ R details','expected to fail: a proof would settle 3, a refutation none');
  assert.deepEqual(keys(dom2,'open-recorded'),['q|s|false','q||r'],'q ⊢ r becomes ⊤ ⊢ r under p; p ⊢ s is settled');
  assert.equal(stmt(dom2,'q|s|false','open-recorded'),'★S ⊬ False (⊥) details'); assert.deepEqual(scores(dom2,'q|s|false','open-recorded'),[0,3]);

  // A sparse map is not ranked, but its recorded conjectures are still listed and scored.
  const sparseReport=report([],[['p'],['q'],['r'],['s']],[],share([],38,0),[],[],[row({premises:['q'],conclusion:'r',yes:2,no:2,rank:null,tier:'bronze',claim:'entails',conjectures:qr})]);
  const dom3=page({topic,principles,results:[conjectures[0]],models:[],progress:[share([],38,0)],lynchpins:{skipped:'100% of the questions are open',reports:[sparseReport]}}),doc3=dom3.window.document;
  show(dom3,'open'); open(dom3,true); open(dom3,true,'open-auto'); open(dom3,true,'open-recorded');
  const det3=doc3.getElementById('lynchpins');
  assert.match(det3.querySelector('.note').textContent,/Too few questions are settled/);
  assert.match(doc3.getElementById('open-auto').querySelector('.note').textContent,/Too few questions are settled/);
  assert.equal(det3.querySelector('table'),null);
  assert.deepEqual(keys(dom3,'open-recorded'),['q|q|r']);
  assert.deepEqual(scores(dom3,'q|q|r','open-recorded'),[2,2]);
  assert.equal(doc3.querySelector('#open-recorded [data-lynchpin="q|q|r"] td.rank').textContent,'—','unranked on a sparse map');
  assert.equal(doc3.getElementById('open-progress').textContent,'0% of 38 questions with up to two premises are settled.');

  // An inconsistent background reports that instead of scores.
  const dom4=page({topic,principles,results:[rule('pq',['p'],'q'),rule('ps',['p','s'],false)],models:[]},'http://localhost/?assume=p,s'),doc4=dom4.window.document;
  show(dom4,'open'); open(dom4,true); open(dom4,true,'open-auto'); open(dom4,true,'open-recorded');
  for(const id of ['lynchpins','open-auto','open-recorded']) assert.match(doc4.getElementById(id).querySelector('.note').textContent,/inconsistent/);
  assert.equal(doc4.getElementById('open-progress').hidden,true,'no settled share under an inconsistent background');

  assert.deepEqual(errors,[]);
  console.log('PASS: settled share, Central Questions by the harmonic mean, Automatically Generated Conjectures stated as the answer to expect, and Conjectures in their records\' direction at their central rank, all in one format with tiered stars and a details link, collapsed and lazy, True class under a stored background, none for an ad-hoc background, sparse maps, and inconsistent backgrounds.');
} finally {
  for(const dom of pages) dom.window.close();
}

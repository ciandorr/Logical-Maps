// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// The Conjectures tab's lynchpin section: a dropdown above the recorded
// questions, lazy, background-aware, and rendered from the rankings that
// scripts/pmap.py stores at build time (Lynchpins.rank); nothing is scored here.
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
function stmt(dom,key) { return dom.window.document.querySelector(`#lynchpins [data-lynchpin="${key}"] td.stmt`).textContent.trim(); }
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert('paper'),proof:'Fixture proof.',sources:['Fixture source'],source_names:['Fixture source']});
const model=(id,satisfies,violates)=>({id,name:id.toUpperCase(),satisfies,violates,status:'proved',certificate:cert('paper'),description:'Fixture construction.',sources:['Fixture source'],source_names:['Fixture source']});
const topic={id:'lynchpins-fixture',title:'Lynchpins fixture',background:[],
  principle_categories:[{id:'basic',name:'Basic principles'}],
  source_catalog:[{id:'paper',name:'A paper',kind:'published-paper'}]};
const principles=['p','q','r','s'].map(id=>({id,name:id.toUpperCase(),statement:`Principle ${id}`,category:'basic'}));
// The selftest topic: p ⇒ q proved, and a model of p violating s. The stored shares and
// rankings below are what pmap.py computes for it; its selftest checks the scores.
const share=(principles,questions,settled)=>({background:null,name:null,principles,negative:[],premises:2,questions,settled,open:questions-settled});
const q=(premises,conclusion,yes,no)=>({kind:'question',premises,conclusion,yes,no});
const check=(model,principle,yes,no)=>({kind:'check',model,principle,yes,no});
const report=(principles,classes,trivial,progress,rows)=>({background:null,name:null,principles,negative:[],inconsistent_background:false,classes,trivial,fitting_models:['m1'],open:progress.open,progress,rows});
const rowsNone=[q(['r'],'false',17,0),q(['s'],'false',14,0),q(['q','r'],'false',13,1),q([],'r',11,0),q(['q','s'],'false',10,1),q(['r','s'],'q',0,10),q([],'p',10,0),q(['q'],'r',9,1),q(['p','r'],'false',8,2),q(['r','s'],'false',8,2),q(['p','s'],'r',0,8),q(['p'],'r',7,2),check('m1','r',6,3),q(['r','s'],'p',1,6)];
const rowsP=[q(['r'],'false',4,0),q(['s'],'false',3,0),q([],'r',3,0),q(['r','s'],'false',2,2),check('m1','r',2,1),q(['s'],'r',0,2),q(['r'],'s',1,1)];
const fixture={topic,principles,results:[rule('pq',['p'],'q')],models:[model('m1',['p'],['s'])],
  progress:[share([],33,6),share(['p'],7,1)],
  lynchpins:{skipped:null,reports:[
    report([],[['p'],['q'],['r'],['s']],[],share([],33,6),rowsNone),
    report(['p'],[['p','q'],['r'],['s']],['p','q'],share(['p'],7,1),rowsP)]}};

try {
  const dom=page(fixture),doc=dom.window.document;
  const det=()=>doc.getElementById('lynchpins');   // re-fetched: renderAll rebuilds the section
  const recorded=()=>doc.getElementById('open-recorded');
  const progress=()=>doc.getElementById('open-progress');
  const body=()=>det().querySelector('.lynchpin-body');
  assert.equal(progress().hidden,true,'no settled share while another tab is shown');
  assert.ok(det(),'the Conjectures tab carries a lynchpin section');
  assert.equal(det().open,false,'the section starts collapsed');
  assert.equal(body().innerHTML,'','nothing is rendered while the section is closed');
  assert.equal(det().querySelector('.hint').textContent,'Open questions ranked by how many other open questions each answer would settle.');
  // Two peer dropdowns: lynchpins first, then the recorded questions, both collapsed at first.
  assert.ok(det().compareDocumentPosition(recorded())&dom.window.Node.DOCUMENT_POSITION_FOLLOWING,'lynchpins precede the recorded questions');
  assert.equal(recorded().open,false);
  assert.equal(recorded().querySelector('summary').textContent.trim(),'Recorded conjectures','no count on the dropdown');
  assert.match(recorded().querySelector('.empty').textContent,/No conjectures have been recorded/);
  show(dom,'open');
  assert.equal(body().innerHTML,'','still nothing while the section is closed');
  assert.equal(progress().hidden,false);
  assert.equal(progress().textContent,'18% of questions with up to two premises settled.');
  assert.match(progress().title,/^6 of 33 questions/);
  open(dom,true);
  assert.equal(det().querySelector('.note'),null,'no count summary above the table');
  assert.equal(det().querySelectorAll('table.lynchpin').length,1,'one list: implications, consistency and model checks are not split');
  const keys=()=>[...det().querySelectorAll('table.lynchpin tbody tr')].map(tr=>tr.dataset.lynchpin);
  assert.equal(keys().length,rowsNone.length,'every stored row is shown');
  assert.deepEqual(keys().slice(0,4),['q|r|false','q|s|false','q|q+r|false','q||r'],'in stored order: consistency, theorem and implication questions together');
  assert.deepEqual(scores(dom,'q|r|false'),[17,0],'r ⇒ ⊥: excluding r settles every question about it');
  assert.deepEqual(scores(dom,'q||r'),[11,0],'⊤ ⇒ r: a theorem question has no premises');
  assert.deepEqual(scores(dom,'q|r+s|q'),[0,10],'r ∧ s ⇒ q: a two-premise question');
  assert.deepEqual(scores(dom,'check|m1|r'),[6,3],'a model check sits in the same list');
  assert.equal(stmt(dom,'q|r|false'),'R ⇒ False (⊥)');
  assert.equal(stmt(dom,'q||r'),'True (⊤) ⇒ R');
  assert.equal(stmt(dom,'q|r+s|q'),'R ∧ S ⇒ Q');
  assert.equal(stmt(dom,'check|m1|r'),'M1: R');
  assert.ok(det().querySelector('[data-lynchpin="q|r+s|q"] button[data-principle="r"]'),'principles are clickable');
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
  // Each dropdown remembers its state across a re-render.
  recorded().open=true; recorded().dispatchEvent(new dom.window.Event('toggle'));
  dom.window.eval('renderAll(false)');
  assert.equal(recorded().open,true,'opening the recorded questions survives a re-render');
  assert.equal(det().open,true);
  assert.deepEqual(scores(dom,'q|r|false'),[17,0],'the table survives a re-render');
  recorded().open=false; recorded().dispatchEvent(new dom.window.Event('toggle'));
  // Closing clears the body; reopening restores it.
  open(dom,false);
  assert.equal(body().innerHTML,'');
  dom.window.eval('renderAll(false)');
  assert.equal(det().open,false,'a closed lynchpin section stays closed across a re-render');
  assert.equal(body().innerHTML,'');
  open(dom,true);
  assert.deepEqual(scores(dom,'q|r|false'),[17,0]);
  // An ad-hoc background has no stored ranking or share; nothing is computed for it.
  show(dom,'graph');
  dom.window.eval("background.add('r'); renderAll(false)");
  assert.equal(body().innerHTML,'','nothing is rendered while another tab is shown');
  show(dom,'open');
  assert.match(body().textContent,/Ranked at build time/);
  assert.equal(det().querySelector('table'),null);
  assert.equal(progress().hidden,true,'no stored share for an ad-hoc background');

  // Under a stored preset background the entailed class collapses into True.
  const dom2=page(fixture,'http://localhost/?assume=p'),doc2=dom2.window.document;
  show(dom2,'open'); open(dom2,true);
  const det2=doc2.getElementById('lynchpins');
  assert.equal(doc2.getElementById('open-progress').textContent,'14% of questions with up to two premises settled.','the stored share for the p background');
  assert.equal(det2.querySelectorAll('tbody tr').length,rowsP.length);
  assert.equal(stmt(dom2,'q||r'),'True (⊤) ⇒ R');
  assert.equal(det2.querySelector('[data-lynchpin="q|q|r"]'),null,'q is in the True class and asks nothing');
  assert.deepEqual(scores(dom2,'q|r+s|false'),[2,2]);

  // A sparse map is not ranked.
  const dom3=page({topic,principles,results:[],models:[],progress:[share([],38,0)],lynchpins:{skipped:'100% of the questions are open',reports:[]}}),doc3=dom3.window.document;
  show(dom3,'open'); open(dom3,true);
  const det3=doc3.getElementById('lynchpins');
  assert.match(det3.querySelector('.note').textContent,/Too few questions are settled/);
  assert.equal(det3.querySelector('table'),null);
  assert.equal(doc3.getElementById('open-progress').textContent,'0% of questions with up to two premises settled.');

  // An inconsistent background reports that instead of scores.
  const dom4=page({topic,principles,results:[rule('pq',['p'],'q'),rule('ps',['p','s'],false)],models:[]},'http://localhost/?assume=p,s'),doc4=dom4.window.document;
  show(dom4,'open'); open(dom4,true);
  assert.match(doc4.getElementById('lynchpins').querySelector('.note').textContent,/inconsistent/);
  assert.equal(doc4.getElementById('open-progress').hidden,true,'no settled share under an inconsistent background');

  assert.deepEqual(errors,[]);
  console.log('PASS: settled share and one stored lynchpin list (questions with up to two premises and model checks together) above the recorded questions, collapsed and lazy, True class under a stored background, none for an ad-hoc background, sparse maps, and inconsistent backgrounds.');
} finally {
  for(const dom of pages) dom.window.close();
}

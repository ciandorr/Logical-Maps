// NODE_PATH=/path/to/node_modules node scripts/check_core_questions_ui.cjs
// The Conjectures tab's Core Questions: the ranked questions that pmap.py marks as core (no
// premise or one; A ∧ B ⊢ ⊥; A ∧ B ⊢ C with C ⊢ A and C ⊢ B established), in their core order with their
// core scores, under the High-Value Questions, with their own settled share.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const cert={source_id:'paper',lean:'none',produced_by:'Fixture',checked_by:[]};
const principles=['a','b','c','d'].map(id=>({id,name:id.toUpperCase(),statement:'Principle '+id}));
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert,sources:['Fixture'],source_names:['Fixture']});
// c ⇒ a and c ⇒ b are proved, so a ∧ b ⊢ c is core; a ∧ d ⊢ c is not.
const row=o=>({kind:'question',...o});
const rows=[
  row({premises:['a','d'],conclusion:'c',yes:9,no:9,score:9,rank:1,auto_rank:1,auto_claim:'entails'}),
  row({premises:['a','b'],conclusion:'c',yes:5,no:5,score:5,rank:2,auto_rank:2,auto_claim:'entails',core_yes:2,core_no:4,core_score:2.7,core_rank:2}),
  row({premises:['d'],conclusion:'a',yes:3,no:3,score:3,rank:3,auto_rank:3,auto_claim:'entails',core_yes:3,core_no:3,core_score:3,core_rank:1}),
  {kind:'check',model:'m',principle:'d',yes:2,no:2,score:2,rank:4,auto_rank:4,auto_claim:'entails'},
  row({premises:['b','d'],conclusion:'false',yes:1,no:1,score:1,rank:5,auto_rank:5,auto_claim:'entails',core_yes:1,core_no:1,core_score:1,core_rank:3})];
// Bits a,b,c,d = 0..3. Group masks: [premises, conclusions, settled, consistency, core conclusions].
const selection={principles:['a','b','c','d'],groups:[
  [[],'0xf','0xf',null,'0xf'],
  [['d'],'0x7','0x4','open','0x7'],[['b','d'],'0x1','0x0','open','0x0'],
  [['a','b'],'0xc','0x8','refuted','0x4'],[['a','d'],'0x4','0x0','refuted','0x0']]};
const progress={background:null,name:null,principles:[],negative:[],premises:2,questions:18,settled:9,open:9,core:{questions:10,settled:4,open:6},selection};
const data={topic:{id:'core',title:'Core fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles,results:[rule('ca',['c'],'a'),rule('cb',['c'],'b')],models:[{id:'m',name:'M',status:'proved',satisfies:['a'],violates:[],certificate:cert,sources:['Fixture'],source_names:['Fixture']}],
  progress:[progress],
  lynchpins:{skipped:null,reports:[{background:null,name:null,principles:[],negative:[],inconsistent_background:false,classes:[['a'],['b'],['c'],['d']],trivial:[],fitting_models:['m'],open:9,progress,rows,auto:rows,recorded:[]}]}};
const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data)),{url:'http://localhost/?assume=',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
const w=dom.window,d=w.document;
const open=(id,v=true)=>{const det=d.getElementById(id);det.open=v;det.dispatchEvent(new w.Event('toggle'));return d.getElementById(id);};
const keys=id=>[...d.querySelectorAll(`#${id} table.lynchpin tbody tr`)].map(tr=>tr.dataset.lynchpin);
try{
  d.querySelector('[data-tab="open"]').click();
  const hv=d.getElementById('lynchpins'),core=d.getElementById('open-core');
  assert.equal(hv.querySelector('summary').textContent.trim(),'High-Value Questions','renamed');
  assert.equal(core.querySelector('summary').textContent.trim(),'Core Questions');
  assert.equal(hv.nextElementSibling,core,'immediately below the High-Value Questions');
  assert.match(core.querySelector('.hint').textContent,/^Core Questions correspond to implications of the form \(a\) ⊢ C, with no premises; \(b\) A ⊢ C.*\(c\) A ∧ B ⊢ ⊥.*\(d\) A ∧ B ⊢ C, where C ⊢ A and C ⊢ B are already established\. Open Core Questions are ranked by how many Core Questions both answers would settle, the geometric mean of if yes and if no/);
  assert.equal(core.open,false,'starts collapsed');
  assert.equal(d.getElementById('open-core-progress').textContent,'5 (41.7%) of 12 Core Questions are open.','its own settled share, from the core masks');
  assert.equal(d.getElementById('open-progress').textContent,'7 (46.7%) of 15 questions with up to two premises are open.');
  open('open-core');
  assert.deepEqual(keys('open-core'),['q|d|a','q|a+b|c','q|b+d|false'],'only the core questions, in core order');
  const cells=[...d.querySelectorAll('#open-core tbody tr')].map(tr=>[...tr.querySelectorAll('td.num')].map(td=>td.textContent));
  assert.deepEqual(cells,[['1','3','3'],['2','2','4'],['3','1','1']],'core ranks and core scores, not the high-value ones');
  open('lynchpins');
  assert.deepEqual(keys('lynchpins'),['q|a+d|c','q|a+b|c','q|d|a','check|m|d','q|b+d|false'],'the High-Value Questions are unchanged');
  // Hiding D drops the questions that mention it, and the core share counts the shown principles only.
  w.eval(`state.openExcluded.add("d"); renderLynchpins()`);
  open('open-core');
  assert.deepEqual(keys('open-core'),['q|a+b|c']);
  assert.equal(d.getElementById('open-core-progress').textContent,'1 (20.0%) of 5 Core Questions are open.');
  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: Core Questions sit below the renamed High-Value Questions, list only core questions in core order with core scores, and count their open ones over the shown principles.');
}finally{w.close();}

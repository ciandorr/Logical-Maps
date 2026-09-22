// NODE_PATH=/path/to/node_modules node scripts/check_model_verdicts_ui.cjs
// A model's page sorts every principle by what the model says about it:
// satisfied, violated, or not settled. A model records a few properties and
// the rest follow, so the derived verdicts wait behind a closed disclosure.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const cert={source_id:'paper',lean:'none',produced_by:'Fixture',checked_by:[]};
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert,sources:['Fixture'],source_names:['Fixture']});
// A holds and B fails by record. C follows from A, so it holds; D would force
// B, so it fails. Nothing touches E.
const data={topic:{id:'verdicts',title:'Verdict fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles:['a','b','c','d','e'].map(id=>({id,name:id.toUpperCase(),statement:'Statement of '+id.toUpperCase()})),
  results:[rule('ac',['a'],'c'),rule('db',['d'],'b')],
  models:[{id:'m',name:'Fixture model',status:'proved',satisfies:['a'],violates:['b'],certificate:cert,sources:['Fixture'],source_names:['Fixture']}]};
const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),
  {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
const w=dom.window,d=w.document;
try{
  w.eval('openPage({type:"model", id:"m"})');
  const page=d.getElementById('page');
  assert.equal(page.querySelector('h1').textContent,'Fixture model');

  // The three groups, named and counted, in the order a reader asks about.
  const heads=[...page.querySelectorAll('h3.verdict-group')];
  assert.deepEqual(heads.map(h=>h.firstChild.textContent.trim()),['Satisfied','Violated','Unknown'],'Three groups, verdict first');
  assert.deepEqual(heads.map(h=>h.querySelector('.n').textContent),['2','2','1'],'Each counts everything it covers, shown or not');

  // Everything between one heading and the next belongs to that group.
  const section=head=>{const out=[];let n=head.nextElementSibling;
    while(n&&!['H2','H3'].includes(n.tagName)){out.push(n);n=n.nextElementSibling;}return out;};
  const named=el=>[...el.querySelectorAll('tr')].map(tr=>tr.querySelector('[data-principle]')?.dataset.principle);
  const groups=Object.fromEntries(heads.map(h=>{
    const parts=section(h), details=parts.find(x=>x.tagName==='DETAILS');
    return [h.firstChild.textContent.trim(),
      {listed:parts.filter(x=>x.tagName==='TABLE').flatMap(named), details, hidden:details?named(details):[]}];
  }));
  assert.deepEqual(groups.Satisfied.listed,['a'],'The recorded verdict is listed');
  assert.deepEqual(groups.Satisfied.hidden,['c'],'The derived one waits behind the disclosure');
  assert.deepEqual(groups.Violated.listed,['b']);
  assert.deepEqual(groups.Violated.hidden,['d']);
  assert.deepEqual(groups.Unknown.listed,['e'],'Nothing is derived about a principle the model leaves open');
  assert.equal(groups.Unknown.details,undefined,'So that group has no disclosure');
  assert.equal([...page.querySelectorAll('.verdict-table tr')].length,data.principles.length,'Every principle appears exactly once');

  // Closed by default, and the rows are inside it, which is what makes the
  // browser hide them; jsdom lays nothing out, so the structure is the contract.
  for (const key of ['Satisfied','Violated']) {
    assert.equal(groups[key].details.open,false,`The ${key.toLowerCase()} disclosure starts closed`);
    assert.equal(groups[key].details.firstElementChild.tagName,'SUMMARY');
    assert.match(groups[key].details.querySelector('summary').textContent,/^1 more, derived/,'And says how many it holds');
  }

  // The principle is the left column; the evidence sits to its right and keeps
  // its route to the derivation.
  const row=id=>page.querySelector(`[data-principle="${id}"]`).closest('tr');
  assert.equal(row('a').firstElementChild.querySelector('[data-principle]').dataset.principle,'a','The name leads the row');
  const evidence=id=>row(id).querySelector('.verdict-cell [data-verdict]');
  assert.equal(evidence('a').dataset.verdictModel,'m','A recorded verdict still links to its evidence');
  assert.equal(evidence('c').dataset.verdict,'c','And so does a derived one');
  assert.equal(row('e').querySelector('[data-verdict]'),null,'An unsettled principle has no evidence to link to');

  // The group heading carries the verdict, so the rows under it do not repeat
  // the mark; what is left to report is the derivation and the sources.
  assert.equal(evidence('a').querySelector('.model-flag').textContent,'','A recorded row adds no mark of its own');
  assert.equal(evidence('c').querySelector('.model-flag').textContent,'derived','A derived row says only that');
  assert.ok(evidence('a').querySelector('.badge.source'),'Both still carry their sources');
  assert.ok(evidence('c').querySelector('.badge.source'));

  // The mark stays where no heading gives it: the theory explorer's own list.
  d.querySelector('.tab[data-tab="models"]').click();
  w.eval('select({type:"model", id:"m"})');
  const explorer=d.querySelector('#model-principles [data-assumption-row="a"] [data-verdict]');
  assert.equal(explorer.querySelector('.model-flag').textContent,'✓','The explorer still shows the verdict itself');

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: a model page sorts every principle into satisfied, violated and unsettled, counts each group, leads each row with the principle, keeps the route to the evidence, and holds the derived verdicts in a closed disclosure while the ungrouped explorer list keeps its marks.');
}finally{w.close();}

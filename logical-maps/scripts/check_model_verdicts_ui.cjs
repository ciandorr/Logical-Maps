// NODE_PATH=/path/to/node_modules node scripts/check_model_verdicts_ui.cjs
// A model's page sorts every principle by what the model says about it:
// satisfied, violated, or not settled. A model records a few properties and
// the rest follow, so the derived verdicts wait behind a closed disclosure.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const cert={source_id:'paper',lean:'none',produced_by:'Fixture',checked_by:[]};
// The model itself is Lean-checked; the results that derive from it are not.
const leanCert={...cert,lean:'verified',lean_ref:'Fixture.model'};
const rule=(id,premises,conclusion)=>({id,premises,conclusion,status:'proved',certificate:cert,sources:['Fixture'],source_names:['Fixture']});
// A holds and B fails by record. C follows from A, so it holds; D would force
// B, so it fails. Nothing touches E.
const data={topic:{id:'verdicts',title:'Verdict fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles:['a','b','c','d','e'].map(id=>({id,name:id.toUpperCase(),statement:'Statement of '+id.toUpperCase()})),
  results:[rule('ac',['a'],'c'),rule('db',['d'],'b')],
  models:[{id:'m',name:'Fixture model',status:'proved',satisfies:['a'],violates:['b'],certificate:leanCert,sources:['Fixture'],source_names:['Fixture']}]};
const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data)),
  {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
const w=dom.window,d=w.document;
try{
  w.eval('openPage({type:"model", id:"m"})');
  const page=d.getElementById('page');
  assert.equal(page.querySelector('h1').textContent,'Fixture model');

  // Three columns, named and counted, in the order a reader asks about.
  const cols=[...page.querySelectorAll('.verdict-columns section.verdict-col')];
  const heads=cols.map(c=>c.querySelector('h3.verdict-group'));
  assert.deepEqual(heads.map(h=>h.firstChild.textContent.trim()),['Satisfied','Violated','Unknown'],'Three columns, verdict first');
  assert.deepEqual(heads.map(h=>h.querySelector('.n').textContent),['2','2','1'],'Each counts everything it covers, shown or not');
  const named=el=>[...el.querySelectorAll(':scope > ul.verdict-list [data-principle]')].map(b=>b.dataset.principle);
  const groups=Object.fromEntries(cols.map((c,i)=>{const details=c.querySelector('details.derived-verdicts');
    return [heads[i].firstChild.textContent.trim(),{listed:named(c),details,hidden:details?[...details.querySelectorAll('[data-principle]')].map(b=>b.dataset.principle):[]}];}));
  assert.deepEqual(groups.Satisfied.listed,['a'],'The recorded verdict is listed');
  assert.deepEqual(groups.Satisfied.hidden,['c'],'The derived one waits behind the toggle');
  assert.deepEqual(groups.Violated.listed,['b']);
  assert.deepEqual(groups.Violated.hidden,['d']);
  assert.deepEqual(groups.Unknown.listed,['e'],'Nothing is derived about a principle the model leaves open');
  assert.equal(groups.Unknown.details,null,'So that column has no toggle');
  assert.equal(page.querySelectorAll('.verdict-columns [data-principle]').length,data.principles.length,'Every principle appears exactly once');
  for (const key of ['Satisfied','Violated']) {
    assert.equal(groups[key].details.open,false,`The ${key.toLowerCase()} toggle starts closed`);
    assert.equal(groups[key].details.firstElementChild.tagName,'SUMMARY');
    assert.equal(groups[key].details.querySelector('summary').textContent,'+ 1 derived','And says how many it holds');
  }

  // Each principle has one small control and nothing else: no sources, no marks.
  const item=id=>page.querySelector(`.verdict-columns [data-principle="${id}"]`).closest('li');
  const control=id=>item(id).querySelectorAll('button.vc');
  assert.deepEqual(['a','b','c','d','e'].map(id=>control(id).length),[1,1,0,0,0],'One control each; a derived verdict has its why instead, an open question nothing');
  assert.equal(control('a')[0].dataset.verdictModel,'m','A recorded verdict of a list-format model goes to its evidence');
  assert.equal(control('a')[0].textContent,'↗');
  // A derived verdict opens its derivation in place: no page, no pop-up.
  const why=id=>item(id).querySelector('details.why');
  assert.deepEqual(['a','b','c','d','e'].map(id=>!!why(id)),[false,false,true,true,false]);
  assert.equal(why('c').querySelector('summary').textContent,'why');
  assert.equal(why('c').open,false);
  const lines=el=>[...el.querySelectorAll('ol li')].map(li=>li.textContent.replace(/\s+/g,' ').trim());
  assert.match(why('c').textContent,/Follows from the model’s recorded properties/);
  assert.match(lines(why('c'))[0],/^✓ A recorded for the model/,'The starting point first');
  assert.match(lines(why('c'))[1],/^A ⇒ C/,'Then the result');
  assert.match(why('d').textContent,/Supposing D would give B, which the model violates/);
  assert.deepEqual(lines(why('d')).map(l=>l.split(' ').slice(0,3).join(' ')),['D supposed, to','✗ B recorded','D ⇒ B'],'A failure starts from the supposition and the verdict it clashes with');
  assert.equal(page.querySelector('h1').textContent,'Fixture model','No page is opened for a derivation');
  assert.ok(d.getElementById('pop').hidden);
  assert.equal([...page.querySelectorAll('.verdict-columns .badge')].filter(b=>!b.closest('details.why')).length,0,'No source information in the columns outside a derivation');
  assert.equal(w.getComputedStyle(page.querySelector('.verdict-columns')).display,'grid');

  // Lean status and sources stay one click away, on the verdict's own pop-up: a
  // verdict is Lean-checked only when everything under it is.
  w.eval('select({type:"model-verdict", id:"m", principle:"a"})');
  assert.ok(d.getElementById('pop').querySelector('.badge.lean.verified'),'A recorded verdict of a Lean-checked model says so');
  w.eval('select({type:"model-verdict", id:"m", principle:"c"})');
  assert.equal(d.getElementById('pop').querySelector('.badge.lean.verified'),null,'A verdict derived through an unverified result does not');
  w.eval('select(null)');

  // And the one-line answer at the foot of the graph's details pane carries it
  // beside the witness it names.
  d.querySelector('.tab[data-tab="graph"]').click();
  w.eval('select({type:"principle", id:"a"})');
  const foot=d.getElementById('graph-details-foot');
  assert.match(foot.textContent,/Consistent with the background \(Fixture model\)/,'The foot names the witness');
  assert.ok(foot.querySelector('.badge.lean.verified'),'And says it is Lean-checked');
  w.eval('select(null)');
  assert.equal(foot.hidden,true);
  w.eval('openPage({type:"model", id:"m"})');

  // The mark stays where no heading gives it: the theory explorer's own list.
  d.querySelector('.tab[data-tab="models"]').click();
  d.querySelector('#models [data-ex-inspect="model"][data-id="m"]').click();
  const explorer=d.querySelector('#model-principles [data-assumption-row="a"] [data-verdict]');
  assert.equal(explorer.querySelector('.model-flag').textContent,'✓','The explorer still shows the verdict itself');
  const derivedRow=d.querySelector('#model-principles [data-assumption-row="c"]');
  assert.equal(derivedRow.querySelector('.model-flag').textContent,'✓ derived');
  assert.equal(derivedRow.querySelector('details.why summary').textContent,'why','And a derived verdict opens its derivation in place there too');
  assert.match(lines(derivedRow.querySelector('details.why'))[1],/^A ⇒ C/);

  assert.deepEqual(errors.map(String),[]);
}finally{w.close();}

// A model written as a definition and arguments, as the build exports it: the
// flattened lists beside the arguments, and a generated conjectured companion.
const argCert={...cert,date:'2026-01-01',produced_by:'Author'};
const args=[{holds:['a'],text:'Why A holds.'},{fails:['b'],text:'First reason B fails.',id:'first'},
  {fails:['b'],writeup:'b-writeup',by:'Later author',date:'2026-02-01',revisions:[{date:'2026-02-02',note:'Tidied.'}]},
  {holds:['e'],standing:'conjectured',tier:'bronze',text:'Why E might hold.',companion_id:'n-conj',date:'2026-01-20'},
  {holds:['a'],fails:['b'],text:'One argument for both.',by:'Both author (Lab), later',date:'2026-02-04'},
  {fails:['b'],text:'Found in a trawl.',by:'Trawl agent, trawl',date:'2026-02-05',provenance:'admission-x'}];
const flat={id:'n',name:'Argument model',status:'proved',satisfies:['a'],violates:['b'],certificate:argCert,sources:['Fixture'],source_names:['Fixture'],
  definition:'What the model is.',arguments:args,notes:'Miscellany.',references:[{paper:'fixture-paper',role:'related',locator:'§1',note:'How the construction relates.'}],history:[{date:'2026-01-15',by:'Old',summary:'An old change.',satisfies:['a']}]};
const companion={id:'n-conj',name:'Argument model',status:'conjectured',tier:'bronze',satisfies:['a','e'],violates:['b'],certificate:argCert,sources:['Fixture'],source_names:['Fixture'],
  definition:'What the model is.',arguments:[args[3]],notes:'Why E might hold.',companion_of:'n',model_check:{model:'n',satisfies:['e'],violates:[]}};
// The chain of a theorem-trawl admission, as the build exports it for each record it added to.
const provenance=[{id:'admission-x',file:'topics/t/provenance/admission-x.yaml',records:{n:{found_by:'deepseek/deepseek-flash',found_at:'2026-02-05T10:00:00+00:00',
  reviews:[{by:'openai/gpt-6',at:'2026-02-06T10:00:00+00:00',verdict:'accept',summary:'Checked.',argument_check:'Every step.',source_check:'The source.',issues:[]}],
  admitted_by:'Curator',admitted_at:'2026-02-07T10:00:00+00:00'}}}];
const data2={...data,models:[flat,companion],provenance,papers:[{id:'fixture-paper',title:'Fixture paper',citation:'A. Author, Fixture paper.'}]};
const errors2=[],vc2=new VirtualConsole();vc2.on('jsdomError',e=>errors2.push(e));
const dom2=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data2)),
  {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc2});
const w2=dom2.window,d2=w2.document;
try{
  w2.eval('openPage({type:"model", id:"n"})');
  const page=d2.getElementById('page');
  const h2s=[...page.querySelectorAll('h2')].map(h=>h.textContent);
  assert.ok(h2s.includes('Definition')&&page.textContent.includes('What the model is.'),'The definition comes first');
  assert.ok(h2s.indexOf('Definition')<h2s.indexOf('Principles'));
  // Each principle's one control goes to its arguments; the Arguments section shows each once.
  const item=id=>page.querySelector(`.verdict-columns [data-principle="${id}"]`).closest('li');
  const control=id=>item(id).querySelector('button.vc');
  assert.equal(control('a').dataset.jump,'0 4','A recorded verdict goes to each argument for it');
  assert.equal(control('b').dataset.jump,'1 2 4 5','However many there are');
  assert.equal(control('c'),null,'A derived verdict has its why instead');
  // The derivation opens in place and starts from the verdicts it uses, each linking back
  // to its argument; the jump to an argument and ← back return to the page, then the tab.
  const pane=d2.getElementById('pane-page');
  const why=id=>item(id).querySelector('details.why');
  const lines=el=>[...el.querySelectorAll('ol li')].map(li=>li.textContent.replace(/\s+/g,' ').trim());
  assert.match(lines(why('c'))[0],/^✓ A by its argument in the model/,'The starting point first');
  assert.match(lines(why('c'))[1],/^A ⇒ C/,'Then the result');
  assert.ok(![...page.querySelectorAll('h2')].some(h=>/Paper references|Record provenance|Model evidence/.test(h.textContent)),'No credits on a derivation: its records credit themselves');
  assert.equal([...page.querySelectorAll('.verdict-columns .badge')].filter(b=>!b.closest('details.why')).length,0,'The columns carry no source information outside a derivation');
  why('c').querySelector('ol li button[data-open-arg]').click();
  assert.ok(page.querySelector('#argument-0').open&&page.querySelector('#argument-4').open,'The link opens the model at its arguments');
  assert.ok(!page.querySelector('#argument-1').open);
  assert.equal(page.querySelector('h1').textContent,'Argument model','On the model page itself');
  page.querySelector('#page-back').click();
  assert.equal(page.querySelector('h1').textContent,'Argument model','Back retraces the jump');
  page.querySelector('#page-back').click();
  assert.notEqual(pane.dataset.active,'true','Then back to the tab');
  w2.eval('openPage({type:"model", id:"n"})');
  assert.deepEqual(lines(why('d')).map(l=>l.split(' ').slice(0,3).join(' ')),['D supposed, to','✗ B by','D ⇒ B'],'A failure starts from the supposition and the verdict it clashes with');
  assert.equal(control('e').dataset.jump,'3','An open question with a conjectured argument goes to it');
  assert.ok(control('e').classList.contains('conj'));
  assert.equal([...page.querySelectorAll('.verdict-columns .badge')].filter(b=>!b.closest('details.why')).length,0,'No source information in the columns outside a derivation');
  assert.ok(h2s.indexOf('Principles')<h2s.indexOf('Arguments')&&h2s.indexOf('Arguments')<h2s.indexOf('Notes'));
  assert.ok(!h2s.some(h=>/Paper references|Record provenance/.test(h)),'An argument model credits inside its arguments, not in record-level lists');
  const notesList=[...page.querySelectorAll('h2')].find(h=>h.textContent==='Notes').nextElementSibling.nextElementSibling;
  assert.match(notesList.textContent,/Related: Fixture paper — §1How the construction relates\./,'Its paper references sit with its notes');
  const listed=[...page.querySelectorAll('details.argument[id]')];
  assert.deepEqual(listed.map(x=>x.id),args.map((_,i)=>'argument-'+i),"Each argument once, in the record's order");
  assert.equal(page.querySelectorAll('h3.argument-group').length,0,'Not grouped by date');
  const summary=i=>page.querySelector(`#argument-${i} summary`).textContent.trim();
  assert.equal(summary(4),'✓ A ✗ B','An argument is headed by its verdicts, and only them');
  assert.match(summary(3),/^✓ E conjecture · bronze$/,'A conjectured one says so');
  assert.equal(page.querySelector('#argument-4 .credit').textContent,'Both author (Lab), later, 2026-02-04.','Who and when sit inside');
  assert.equal(page.querySelector('#argument-0 .credit').textContent,'Author, 2026-01-01.','By default, the certificate');
  assert.match(page.querySelector('#argument-1').textContent,/n#first/,'An argument with an id shows its address');
  assert.equal(page.querySelector('#argument-2 a').getAttribute('href'),'writeups/b-writeup.html');
  assert.match(page.querySelector('#argument-2').textContent,/Revised 2026-02-02: Tidied\./);
  control('b').click();
  assert.deepEqual(['1','2','4','5'].map(i=>page.querySelector('#argument-'+i).open),[true,true,true,true],'The control opens every argument for the verdict');
  assert.ok(page.querySelector('#argument-1').classList.contains('flash'),'And marks them');
  assert.equal(page.querySelector('#argument-0').open,false,'But no other');
  const trawled=page.querySelector('#argument-5');
  assert.equal(trawled.querySelector('.credit').textContent,'Found by deepseek/deepseek-flash, 2026-02-05 → reviewed by openai/gpt-6, 2026-02-06 (accept) → admitted by Curator, 2026-02-07.',
    'A trawl argument is credited to who found, reviewed and admitted it');
  assert.match(trawled.querySelector('details.review').textContent,/Checked\..*Argument check: Every step\..*Source check: The source\./s,'With the review report at hand');
  assert.match(trawled.textContent,/provenance\/admission-x\.yaml/);
  assert.ok(h2s.includes('Notes')&&h2s.includes('History'));
  const history=page.querySelector('details.history');
  assert.ok(history&&!history.open&&/An old change\./.test(history.textContent),'The old log waits behind a toggle');
  assert.match(history.querySelector('summary').textContent,/1 entry$/);

  w2.eval('select({type:"model-verdict", id:"n", principle:"b"})');
  assert.deepEqual([...d2.getElementById('pop').querySelectorAll('.badges .badge')].map(b=>b.textContent),['Paper','Later author','Both author','trawl'],'A recorded verdict’s pop-up credits its arguments');
  w2.eval('select(null)');

  // A hand-written write-up is linked, and does not take the definition's place.
  w2.eval(`byMid.get('n').files={handwritten:true,html:'writeups/n.html'};openPage({type:"model", id:"n"})`);
  assert.equal(page.querySelector('.writeup-note a').getAttribute('href'),'writeups/n.html');
  assert.match(page.querySelector('.record-summary').textContent,/What the model is\./);

  w2.eval('openPage({type:"model", id:"n-conj"})');
  assert.ok(page.querySelector('.record-summary [data-open-model="n"]'),'A companion names the model it conjectures about');
  assert.match(page.querySelector('dl').textContent,/conjectured by.*Author, 2026-01-20.*model.*Argument model/,'And who proposed its arguments, not the model\'s certificate');
  assert.ok(![...page.querySelectorAll('h2')].some(h=>h.textContent==='Notes'),'Its notes are its arguments, shown once');
  args[3].id='guess';w2.eval(`byMid.get('n-conj').arguments[0].id='guess';openPage({type:"model", id:"n-conj"})`);
  assert.match(page.textContent,/n#guess/,'Its arguments keep the address they have in the model');

  // The Changes tab keeps the logged history, and an argument added since it is a change of its own.
  w2.eval('state.search="";renderResults()');
  const changes=[...d2.querySelectorAll('#results tr')].map(tr=>tr.textContent);
  assert.ok(changes.some(x=>x.includes('An old change.')),'History entries are changes');
  assert.ok(changes.some(x=>x.includes('Argument added.')&&x.includes('2026-02-01')),'A later argument is one');
  assert.ok(changes.some(x=>x.includes('Tidied.')),'And so is its revision');
  assert.ok(!changes.some(x=>x.includes('Why A holds')),'An argument as old as the record is not');
  assert.ok(changes.some(x=>x.includes('Conjectured argument added: Why E might hold.')),'A later conjectured argument is a change too');
  companion.arguments[0].revisions=[{date:'2026-03-01',note:'Conjecture restated.'}];
  w2.eval(`byMid.get('n-conj').arguments[0].revisions=[{date:'2026-03-01',note:'Conjecture restated.'}];renderResults()`);
  const rows=[...d2.querySelectorAll('#results tr')];
  assert.ok(rows.some(tr=>tr.dataset.id==='n-conj'&&tr.textContent.includes('Conjecture restated.')),'A companion\'s changes are its arguments\' revisions');
  assert.ok(rows.some(tr=>tr.dataset.id==='n-conj'&&tr.textContent.includes('2026-01-20')&&!tr.classList.contains('revision')),'And it is dated by its latest argument, not by the model');
  assert.deepEqual(errors2.map(String),[]);
  console.log('PASS: a model page sorts every principle into three columns, satisfied, violated and unsettled, counts each, gives each principle one control to its evidence or arguments and a derived verdict its derivation in place, starting from the verdicts it uses and linking each to its argument, a back button that retraces the pages, holds the derived verdicts behind a closed toggle, keeps Lean status on the pop-up of a verdict while the explorer list keeps its marks; a model written as arguments shows its definition, then three columns of principles with one control each and no sources, each argument once in record order headed by its verdicts with who supplied it inside (for a trawl argument, who found, reviewed and admitted it), its history behind a toggle, a write-up that does not replace the definition, and its companion.');
}finally{w2.close();}

// A group's member, as the build exports it: its own arguments, then the group's shared arguments
// that apply, each marked with the group; and the group's own page.
const group={id:'g',name:'Fixture group',file:'topics/t/groups/g.yaml',definition:'Arrows: {{monoid}}. {{sigma}}',
  parameters:{monoid:{text:'The monoid.'},sigma:{text:'Σ.',generate:true,values:{top:{text:'Σ is top.',label:'Σ top'},atom:{text:'Σ is an atom.',label:'Σ atom'}}}},
  conditions:[{id:'perturbable',text:'Some arrow perturbs.'}],
  arguments:[{id:'always',holds:['a'],text:'Always.',by:'Group author',date:'2026-03-01'},
            {id:'perturbed',fails:['b'],requires:['perturbable'],text:'Perturbed.',by:'Group author',date:'2026-03-02'},
            {id:'atom',fails:['e'],when:{sigma:'atom'},text:'Atom.',by:'Group author',date:'2026-03-03'}]};
const strip=a=>{const {when,requires,...rest}=a;return rest;};
const member={id:'gm',name:'Fixture: group member',status:'proved',satisfies:['e','a'],violates:['b'],certificate:argCert,sources:['Fixture'],source_names:['Fixture'],
  group:'g',settings:{monoid:'the truncations',sigma:'top'},meets:{perturbable:'g_n does.'},definition:'Arrows: the truncations. Σ is top.',
  arguments:[{holds:['e'],text:'Own.',when:{sigma:'top'}},{...group.arguments[0],group:'g'},
             {...group.arguments[1],group:'g',conditions:[{id:'perturbable',text:'Some arrow perturbs.',reason:'g_n does.'}]}].map(a=>a.group?strip(a):a)};
// A general argument of the topic, which the member gets by meeting its condition.
const generalArg={id:'gen-c',requires:['one-object'],holds:['c'],text:'In general.',by:'Topic author',date:'2026-03-04',file:'topics/t/arguments/gen-c.yaml'};
member.arguments.push({...strip(generalArg),file:undefined,general:'gen-c',conditions:[{id:'one-object',text:'One object.',reason:'It has one.'}]});
member.satisfies.push('c');
// Its variant with the other value of the generated parameter, as the build exports it.
const variant={...member,id:'gm-sigma-atom',name:'Fixture: group member [Σ atom]',variant_of:'gm',satisfies:['a'],violates:['b','e'],
  settings:{monoid:'the truncations',sigma:'atom'},definition:'Arrows: the truncations. Σ is an atom.',
  arguments:[member.arguments[1],member.arguments[2],{...strip(group.arguments[2]),group:'g'}]};
const data3={...data,models:[member,variant],groups:[group],general_arguments:[generalArg],conditions:[{id:'one-object',text:'One object.'}]};
const errors3=[],vc3=new VirtualConsole();vc3.on('jsdomError',e=>errors3.push(e));
const dom3=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data3)),
  {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc3});
const w3=dom3.window,d3=w3.document;
try{
  w3.eval('openPage({type:"model", id:"gm"})');
  const page=d3.getElementById('page');
  assert.ok(page.querySelector('button[data-open-group="g"]'),'A member says which group it belongs to');
  const own=[...page.querySelectorAll('h2 + .arguments details.argument')].map(x=>x.id);
  assert.deepEqual(own,['argument-0'],'Its own arguments first');
  const source=page.querySelector('h3.argument-source');
  assert.match(source.textContent,/From the group Fixture group/,'Then the shared arguments, under their group');
  const shared=[...source.nextElementSibling.querySelectorAll('details.argument')];
  assert.deepEqual(shared.map(x=>x.id),['argument-1','argument-2']);
  assert.match(shared[1].textContent,/Requires: Some arrow perturbs\. Here: g_n does\./,'A shared argument says which condition the member meets, and why');
  assert.match(shared[1].textContent,/Group author, 2026-03-02\./,'And who supplied it');
  assert.match(shared[1].textContent,/g#perturbed/);
  const heads=[...page.querySelectorAll('h3.argument-source')].map(x=>x.textContent);
  assert.deepEqual(heads,['From the group Fixture group','General arguments of the topic'],'Then the topic\'s general arguments');
  const gen=page.querySelector('#argument-3');
  assert.match(gen.textContent,/In general\..*Requires: One object\. Here: It has one\./,'A general argument says how the model meets its condition');
  const item=id=>page.querySelector(`.verdict-columns [data-principle="${id}"]`).closest('li');
  assert.equal(item('b').querySelector('button.vc').dataset.jump,'2','A verdict from a shared argument jumps to it');
  // The general argument's page: its condition and the models it applies to.
  gen.querySelector('button[data-open-argument="gen-c"]').click();
  assert.equal(page.querySelector('h1').textContent,'gen-c');
  assert.match(page.textContent,/Requiresone-object: One object\..*In general\..*Applies toFixture: group member/,'A general argument\'s page');
  page.querySelector('#page-back').click();
  // The group's page.
  page.querySelector('button[data-open-group="g"]').click();
  assert.equal(page.querySelector('h1').textContent,'Fixture group');
  assert.match(page.textContent,/Arrows: ⟨monoid⟩\. ⟨sigma⟩/,'Its definition shows the slots');
  assert.match(page.textContent,/perturbable: Some arrow perturbs\. Met by group member\./);
  const scopes=[...page.querySelectorAll('.shared-scope')].map(x=>x.textContent);
  assert.deepEqual(scopes,['Applies to every member.','Requires perturbable. Applies to every member.','At sigma = Σ atom. Applies to no member at its own settings, only to variants.'],
    'Each shared argument, with where it applies');
  // The grid: a row per member; the variants of a generated parameter on request, with the column they need.
  const rowNames=()=>[...page.querySelectorAll('table.group-grid tbody th')].map(x=>x.textContent);
  const colNames=()=>[...page.querySelectorAll('table.group-grid th.gcol')].map(x=>x.textContent);
  assert.deepEqual(rowNames(),['group member'],'One row per member, named without the shared prefix');
  assert.deepEqual(colNames(),[],'Nothing varies across one member');
  assert.match(page.textContent,/General arguments used.*gen-c ✓ C\. Every member\./,'The general arguments its models use');
  assert.doesNotMatch(page.textContent,/holds → fails/,'The grid, not a summary, shows what a parameter changes');
  page.querySelector('button[data-group-toggle="sigma"]').click();
  assert.deepEqual(rowNames(),['group member','Σ atom'],'The variant as a sub-row');
  assert.deepEqual(colNames(),['E'],'And the column it needs');
  w3.eval("state.excluded.add('e'); renderPage(state.page)");
  assert.deepEqual(colNames(),[],'A principle hidden in the sidebar is not a column');
  assert.match(page.querySelector('.group-bar').textContent,/1 more differs among principles hidden in the sidebar/,'But is counted');
  w3.eval("state.excluded.delete('e'); renderPage(state.page)");
  assert.deepEqual(colNames(),['E']);
  const cell=ri=>page.querySelector(`button.gcell[data-gcell="${ri}"][data-gc="e"]`);
  assert.ok(cell(0).classList.contains('r')&&cell(0).classList.contains('h')&&cell(1).classList.contains('f'),'Recorded cells');
  cell(1).click();
  assert.match(page.querySelector('#group-detail').textContent,/E fails in group member \(Σ atom\).*Atom\./,'A cell shows its argument');
  page.querySelector('button[data-grow="0"]').click();
  assert.match(page.querySelector('#group-detail').textContent,/the truncations.*Σ top/,'A row name shows the settings');
  assert.equal(page.querySelector('#group-detail h3 button[data-open-model="gm"]').textContent,'group member','And its name links to the model');
  assert.doesNotMatch(page.querySelector('#group-detail').textContent,/model’s page/,'with no separate link');
  // A verdict every row derives opens its derivation in place, as on a model's page.
  const same=[...page.querySelectorAll('h2')].find(h=>h.textContent==='The same in every row').nextElementSibling;
  const derivedD=same.querySelector('ul.verdict-list.derived [data-principle="d"]')?.closest('li');
  assert.ok(derivedD,'D fails in every row by derivation');
  const groupWhy=derivedD.querySelector('details.why');
  assert.equal(groupWhy.querySelector('summary').textContent,'why');
  assert.match(groupWhy.textContent,/Supposing D would give B, which the model violates\. The same in every row\./,'One chain serves every row');
  assert.deepEqual([...groupWhy.querySelectorAll('ol li')].map(li=>li.textContent.replace(/\s+/g,' ').trim().split(' ').slice(0,3).join(' ')),['D supposed, to','✗ B by','D ⇒ B']);
  assert.equal(same.querySelector('ul.verdict-list:not(.derived) [data-principle="a"]').closest('li').querySelector('details.why'),null,'A recorded verdict has none');
  page.querySelector('button[data-group-toggle="sigma"]').click();
  assert.deepEqual(rowNames(),['group member']);
  page.querySelector('#page-back').click();
  assert.equal(page.querySelector('h1').textContent,'Fixture: group member','Back to the member');
  // A principle's page has no list of models; it opens the theory explorer with the principle assumed.
  w3.eval('openPage({type:"principle", id:"e"})');
  assert.equal([...page.querySelectorAll('h2')].some(h=>h.textContent==='Models'),false,'No Models section');
  page.querySelector('button[data-explore="e"][data-explore-sign="negative"]').click();
  assert.equal(d3.querySelector('.tab[data-tab="models"]').getAttribute('aria-selected'),'true','The explorer opens');
  assert.equal(w3.eval('JSON.stringify([[...theory.positive].filter(p=>!topicBackground.includes(p)), [...theory.negative]])'),'[[],["e"]]','with the negation as its one assumption');
  w3.eval('resetTheory()');
  // The theory explorer lists the group once, counting the models that fit and saying which.
  d3.querySelector('[data-tab="models"]').click();
  const exRows=()=>[...d3.querySelectorAll('#models .explorer-models > ul.ex-list > li.ex-m')];
  assert.equal(exRows().length,1,'One row for the group, none for its models');
  assert.ok(!exRows()[0].querySelector('.ex-fit'));
  assert.match(exRows()[0].querySelector('.model-heading').textContent,/^\s*▶\s*Fixture group\s*2 of 2 models\s*$/,'All of a group\'s models fit: nothing more is said');
  const tw=exRows()[0].querySelector('button[data-ex-twisty="members"]'), sub=exRows()[0].querySelector(':scope > .ex-sub');
  assert.ok(tw.getAttribute('aria-expanded')==='false'&&sub.hidden,'A group\'s models are behind a triangle on its line');
  tw.click();
  assert.ok(tw.getAttribute('aria-expanded')==='true'&&!sub.hidden,'Which opens them in place');
  const inner=()=>[...exRows()[0].querySelectorAll(':scope > .ex-sub > .ex-list > li')];
  assert.equal(inner().length,1,'Its models lists the members only');
  let vd=inner()[0].querySelector('[data-ex-variants]');
  assert.ok(vd&&vd.hidden&&/\+1 variant/.test(inner()[0].querySelector('.model-heading').textContent),'A member\'s variants are tucked under it, counted on its line');
  assert.ok(exRows()[0].querySelector(':scope > .ex-sub').querySelector('button[data-ex-twisty="variants"]'),'Behind a triangle of their own');
  assert.match(vd.querySelector('button[data-open-model="gm-sigma-atom"]').textContent,/^Σ atom$/,'A variant is named by what it changes');
  w3.eval('setTheoryAssumption("e","negative")');
  vd=inner()[0].querySelector('[data-ex-variants]');
  assert.ok(!vd.hidden&&inner()[0].classList.contains('ex-unfit')&&/does not fit/.test(inner()[0].textContent),'When only the variant fits, the member heads it and its variants open');
  w3.eval('setTheoryAssumption("e","positive")');
  assert.ok(!inner()[0].querySelector('[data-ex-variants]'),'No variant fits: none is listed');
  assert.match(exRows()[0].querySelector('.model-heading').textContent,/1 of 2 models\s*$/,'Only the member assumes E: the count says so');
  assert.doesNotMatch(exRows()[0].textContent,/Σ top/,'and which models fit is left behind the triangle');
  const head=exRows()[0].querySelector('[data-ex-inspect="group"]');
  assert.ok(head.querySelector('button[data-open-group]'),'The group\'s name is a link to its page');
  assert.equal(exRows()[0].textContent.includes('The group’s page'),false,'With no separate link to it');
  head.click();
  assert.match(d3.querySelector('#models .inspection-note').textContent,/Inspecting Fixture group, through the 1 of its models that fit/);
  const exP=id=>d3.querySelector(`#model-principles li[data-assumption-row="${id}"]`);
  assert.ok(exP('e').classList.contains('model-in')&&exP('b').classList.contains('model-out'),'Inspecting a group tints what holds or fails in all the models that fit');
  const popBefore=d3.getElementById('pop').hidden;
  exRows()[0].querySelector('[data-ex-inspect="group"] button[data-open-group]').click();
  assert.equal(d3.getElementById('pop').hidden,popBefore,'Its name opens no pop-up');
  assert.match(d3.querySelector('#page h1').textContent,/Fixture group/,'But its page');
  d3.querySelector('#page-back').click();
  w3.eval('setTheoryAssumption("e",null)');
  assert.ok(!/model-(in|out|split)/.test(exP('e').className)&&/1✓ 1✗/.test(exP('e').textContent),'And notes a split, untinted');
  // A list of witnesses gathers a group's models into one entry.
  const line=d3.createElement('div');line.innerHTML=w3.eval('statusLine("X", {status:"independent", models:["gm","gm-sigma-atom"]})');
  assert.match(line.textContent,/Fixture group 2 of 2 models$/,'Witnesses from a group are one entry');
  assert.deepEqual(errors3.map(String),[]);
  console.log('PASS: the theory explorer lists a group once, counting the models that fit the assumptions and saying which, inspects a group through them (all hold, all fail, or split), and a list of witnesses gathers a group\'s models into one entry;');
  console.log('PASS: a group\'s member lists its own arguments, then the shared arguments that apply under their group, each saying which condition it relies on and why the member meets it; a group\'s page shows a grid of its members, adds a generated parameter\'s variants and the columns they need on request, says what the parameter changes, shows a cell\'s arguments and a row\'s settings, and lists its definition, parameters, conditions and shared arguments with where each applies.');
}finally{w3.close();}

// Verdicts proved in Lean one by one, without a certificate of the whole model. The model's badge
// counts them. A model written as arguments says so on the argument that gives the verdict, which
// the verdict's ↓ opens; a model whose verdicts are listed says so in the verdict's evidence.
// The verdict columns carry no Lean marks.
{
  const lv={id:'lv',name:'Lean verdict model',status:'proved',satisfies:['a'],violates:['b'],certificate:cert,sources:['Fixture'],source_names:['Fixture'],
    lean:{model:'Fixture.lv',verdicts:[{holds:'a',ref:'Fixture.lv_a',status:'verified',lean_links:[{label:'certificate',url:'https://lean.example/lv_a'}]},
      {fails:'b',ref:'Fixture.lv_b',status:'stated'}]}};
  // A general argument proved in Lean: every model meeting its condition has its verdict.
  const gen={id:'gen',requires:['k'],holds:['c'],text:'Why C holds.',by:'Fixture',date:'2026-01-01',file:'topics/t/arguments/gen.yaml',
    lean:[{holds:'c',ref:'Fixture.gen_c',status:'verified',lean_links:[{label:'certificate',url:'https://lean.example/gen_c'}]}]};
  const la={id:'la',name:'Lean argument model',status:'proved',satisfies:['a','c'],violates:[],certificate:cert,sources:['Fixture'],source_names:['Fixture'],
    arguments:[{holds:['a'],text:'Why A holds.',by:'Fixture',date:'2026-01-01'},{general:'gen',holds:['c'],text:'Why C holds.',by:'Fixture',date:'2026-01-01'}],
    lean:{model:'Fixture.la',verdicts:[{holds:'a',ref:'Fixture.la_a',status:'verified',lean_links:[{label:'certificate',url:'https://lean.example/la_a'}]},
      {holds:'c',ref:'Fixture.la_c',status:'verified',via:{argument:'gen'},lean_links:[{label:'certificate',url:'https://lean.example/la_c'}]}]}};
  const errors4=[],vc4=new VirtualConsole();vc4.on('jsdomError',e=>errors4.push(e));
  const dom4=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify({...data,models:[lv,la],general_arguments:[gen],conditions:[{id:'k',text:'Condition K.'}]})),
    {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc4});
  const w4=dom4.window,d4=w4.document;
  try{
    const page=d4.getElementById('page'),pop=d4.getElementById('pop');
    w4.eval('openPage({type:"model", id:"la"})');
    assert.equal(page.querySelector('.badges .badge.lean').textContent,'Lean: 2 verdicts','The badge counts the verified verdicts');
    assert.equal(page.querySelector('.badges .badge.lean.verified'),null,'And is not the whole-model mark');
    assert.equal(page.querySelectorAll('.verdict-columns .badge.lean').length,0,'No Lean marks in the columns');
    const own=page.querySelector('#argument-0'),general=page.querySelector('#argument-1');
    assert.equal(own.querySelector('summary .badge.lean.verified').title,'Proved in Lean for this model','The argument giving a verdict says so');
    assert.equal(own.querySelector('summary .lean-pop a').getAttribute('href'),'https://lean.example/la_a','And its menu links the model\'s certificate');
    assert.equal(general.querySelector('summary .badge.lean').title,'Proved in Lean for this model','A general argument shows the model\'s certificate, not its own');
    assert.equal(general.querySelector('.lean-pop-head').textContent,'✓ C','under the verdict it proves');
    assert.equal(general.querySelector('.lean-pop a').getAttribute('href'),'https://lean.example/la_c');
    general.querySelector('summary [data-lean-menu]').click();
    assert.equal(general.open,false,'The badge in the summary opens its menu, not the argument');
    assert.equal(general.querySelector('.lean-pop').hidden,false);
    d4.dispatchEvent(new w4.KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
    assert.equal(general.querySelector('.lean-pop').hidden,true,'Escape closes it');
    page.querySelector('.verdict-columns [data-principle="a"]').parentElement.querySelector('button.vc[data-jump]').click();
    assert.equal(own.open,true,'The verdict\'s ↓ opens that argument');
    w4.eval('openPage({type:"argument", id:"gen"})');
    assert.ok(page.querySelector('details.argument summary .badge.lean.verified'),'An argument proved in Lean says so on its own page');
    assert.equal(page.querySelector('details.argument summary .lean-pop a').getAttribute('href'),'https://lean.example/gen_c','And links its certificate');
    w4.eval('openPage({type:"model", id:"lv"})');
    assert.equal(page.querySelector('.badges .badge.lean').textContent,'Lean: 1 verdict','A verdict only stated is not counted');
    page.querySelector('.verdict-columns button.vc[data-verdict="a"]').click();
    assert.equal(pop.hidden,false,'A listed verdict\'s ↗ opens its evidence');
    assert.equal(pop.querySelector('.links .lean-pop a[href="https://lean.example/lv_a"]').textContent,'certificate','Whose Lean badge links the certificate');
    w4.eval('select({type:"model-verdict", id:"lv", principle:"b"})');
    assert.equal(pop.querySelector('.badge.lean.verified'),null,'A verdict only stated is not marked');
    assert.deepEqual(errors4.map(String),[]);
    console.log('PASS: a model\'s verdicts proved in Lean one by one are counted on its badge and shown, with their links, on the argument that gives each (or, for a listed verdict, in its evidence), not in the verdict columns; an argument proved in Lean is marked and links its certificate.');
  }finally{w4.close();}
}

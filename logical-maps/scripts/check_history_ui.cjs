// NODE_PATH=/path/to/node_modules node scripts/check_history_ui.cjs
// The Changes tab's "Progress over time": always open, contributions by day by default (and the
// only view without a history), the question views from the history with this build as a dashed
// last step, and a click on a day limiting the Changes list to the records dated that day, or
// since the history point before.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const model=(id,date,extra={})=>({id,name:id.toUpperCase(),satisfies:[],violates:[],certificate:{source_id:'misc',produced_by:'X',date},...extra});
const shared=[{id:'g',by:'X',date:'2026-01-05',holds:['a'],text:'Shared.'}];
const base={topic:{id:'hist',title:'History fixture',background:[],source_catalog:[]},
  principles:[{id:'a',name:'A',statement:'Statement of A',date:'2026-01-02'},{id:'b',name:'B',statement:'Statement of B',date:'2026-01-05',
    changes:[{date:'2026-01-05',by:'X',summary:'Reworded.'}]}],
  results:[],
  // m1 and m2 are older than the shared argument, which counts once on its own day; m1's argument
  // of its own day comes with the model.
  models:[model('m1','2026-01-02',{arguments:[{id:'own',date:'2026-01-02',holds:['b'],text:'Own.'},{$ref:0}]}),model('m2','2026-01-02',{arguments:[{$ref:0}]})],
  shared_arguments:shared};
const point=(date,q,s,cq,cs,extra={})=>({date,commit:'c'+date.slice(-2),principles:2,results:0,models:0,questions:q,settled:s,core_questions:cq,core_settled:cs,...extra});
const history={ref:'origin/main',points:[point('2026-01-02',10,4,5,2),point('2026-01-05',20,15,8,7,{lean_settled:5,core_lean_settled:3})],
  live:{date:'2026-01-07',live:true,principles:2,results:0,models:0,questions:22,settled:19,core_questions:8,core_settled:8}};
function page(data){
  const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data)),{url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
  return {w:dom.window,d:dom.window.document,errors};
}
const showChanges=d=>[...d.querySelectorAll('.tab')].find(t=>/Changes/.test(t.textContent)).click();

const svg=d=>d.querySelector('#history-chart svg');
// 1. No history: the contributions alone, sized from the records.
{const {w,d,errors}=page(base);showChanges(d);
  assert.equal(d.getElementById('history').hidden,false,'contributions need no history');
  assert.match(svg(d).getAttribute('aria-label'),/^Contributions by day from 2 Jan to 5 Jan/);
  assert.equal(d.querySelector('button[data-history-measure="share"]').hidden,true,'no question views without a history');
  assert.equal(d.querySelector('button[data-history-kind]').closest('.seg').hidden,true);
  const day=date=>svg(d).querySelector(`.bar-day[data-date="${date}"]`);
  day('2026-01-02').dispatchEvent(new w.MouseEvent('mouseenter'));
  assert.match(d.querySelector('.history-tip').textContent,/^2 Jan1 principle, 2 models/,'a principle and two models');
  day('2026-01-05').dispatchEvent(new w.MouseEvent('mouseenter'));
  assert.match(d.querySelector('.history-tip').textContent,/^5 Jan1 principle, 1 argument(?!s)/,'the shared argument once, the revision not at all');
  day('2026-01-05').dispatchEvent(new w.MouseEvent('click',{bubbles:true}));
  assert.match(d.getElementById('changes-filter').textContent,/Showing changes dated 5 Jan\./);
  assert.deepEqual([...d.querySelectorAll('#results tr[data-id]')].map(tr=>tr.dataset.id).sort(),['b','b','m1','m2'],'that day: B, its revision, and the shared argument on each model');
  assert.ok(day('2026-01-05').classList.contains('on'),'the chosen day is marked');
  assert.deepEqual(errors.map(String),[]);}

// 2. With a history: contributions first, then the four question views.
const {w,d,errors}=page({...base,history});
showChanges(d);
const box=d.getElementById('history');
assert.equal(box.hidden,false,'shown with a history');
assert.equal(box.tagName,'SECTION','always open');
assert.match(svg(d).getAttribute('aria-label'),/^Contributions by day/,'contributions by default');
const press=(attr,v)=>d.querySelector(`button[${attr}="${v}"]`).click();
const segs=[...box.querySelectorAll('.history-controls .seg')].map(x=>x.getAttribute('aria-label'));
assert.deepEqual(segs,['Questions','View'],'the question kinds sit left of the views, which stay put');
press('data-history-measure','share');
assert.equal(d.querySelector('button[data-history-kind]').closest('.seg').hidden,false,'the question kinds come with the question views');
assert.match(svg(d).getAttribute('aria-label'),/Questions with up to two premises: open share/);
assert.ok(svg(d).querySelector('path.lean-line'),'a Lean line from the first point with Lean counts');
assert.match(d.querySelector('.history-legend').textContent,/open share with Lean-checked work only/);
assert.ok(svg(d).querySelector('path.main-line.live'),'this build is a dashed last step');
assert.match(d.querySelector('.history-legend').textContent,/this build, not yet published/);
assert.match(d.getElementById('history-note').textContent,/one point a day of main, then this build/);
press('data-history-measure','counts');
assert.match(svg(d).getAttribute('aria-label'),/questions and settled questions/);
assert.ok(svg(d).querySelector('path.settled-area')&&svg(d).querySelector('path.total'),'counts: settled area under the questions line');
assert.ok(svg(d).querySelector('path.lean-area'),'counts: the Lean-settled area inside it');
assert.equal(d.querySelector('button[data-history-measure="counts"]').getAttribute('aria-pressed'),'true');
press('data-history-kind','core');
assert.match(svg(d).getAttribute('aria-label'),/^Core Questions: questions and settled questions/);
press('data-history-measure','share');
assert.match(svg(d).getAttribute('aria-label'),/^Core Questions: open share/);

// 3. A click on a day limits the Changes list to the records dated since the point before.
const hit=svg(d).querySelector('rect');
svg(d).getBoundingClientRect=()=>({left:0,top:0,width:280,height:220,right:280,bottom:220});
hit.dispatchEvent(new w.MouseEvent('mousemove',{bubbles:true,clientX:200,clientY:100}));
assert.match(d.querySelector('.history-tip').textContent,/\+1 argument(?!s)/,'arguments dated since the point before');
assert.match(d.querySelector('.history-tip').textContent,/Lean-checked only: 5 open \(62\.5%\)/,'core: 8 questions, 3 settled in Lean');
press('data-history-measure','counts');
svg(d).getBoundingClientRect=()=>({left:0,top:0,width:280,height:220,right:280,bottom:220});
svg(d).querySelector('rect').dispatchEvent(new w.MouseEvent('mousemove',{bubbles:true,clientX:200,clientY:100}));
assert.match(d.querySelector('.history-tip').textContent,/7 settled \(87\.5%\) of 8.*Lean-checked only: 3 settled \(37\.5%\)/,'the counts view tells what is settled');
press('data-history-measure','share');
hit.dispatchEvent(new w.MouseEvent('click',{bubbles:true,clientX:200,clientY:100}));
const filter=d.getElementById('changes-filter');
assert.equal(filter.hidden,false,'a day filters the changes');
assert.match(filter.textContent,/Showing changes dated 3 Jan–5 Jan\./);
assert.deepEqual([...d.querySelectorAll('#results tr[data-id]')].map(tr=>tr.dataset.id).sort(),['b','b','m1','m2'],'only the records dated in that stretch');
filter.querySelector('button').click();
assert.equal(filter.hidden,true,'Show all clears the filter');
assert.equal(d.querySelectorAll('#results tr[data-id]').length,7);
assert.deepEqual(errors.map(String),[]);
console.log('PASS: Progress over time is always open, shows contributions by day by default (counting a shared argument once and revisions not at all), switches to the four question views with a history, dashes this build, and filters the Changes list by a day.');

// NODE_PATH=/path/to/node_modules node scripts/check_history_ui.cjs
// The Changes tab's "Progress over time": hidden without a history, collapsed by default, one
// chart switching between four views, this build as a dashed last step, and a click on a day
// limiting the Changes list to the records dated since the point before.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const base={topic:{id:'hist',title:'History fixture',background:[],source_catalog:[]},
  principles:[{id:'a',name:'A',statement:'Statement of A',date:'2026-01-02'},{id:'b',name:'B',statement:'Statement of B',date:'2026-01-05'}],
  results:[],models:[]};
const point=(date,q,s,cq,cs,extra={})=>({date,commit:'c'+date.slice(-2),principles:2,results:0,models:0,questions:q,settled:s,core_questions:cq,core_settled:cs,...extra});
const history={ref:'origin/main',points:[point('2026-01-02',10,4,5,2),point('2026-01-05',20,15,8,7)],
  live:{date:'2026-01-07',live:true,principles:2,results:0,models:0,questions:22,settled:19,core_questions:8,core_settled:8}};
function page(data){
  const errors=[],vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data)),{url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
  return {w:dom.window,d:dom.window.document,errors};
}
const showChanges=d=>[...d.querySelectorAll('.tab')].find(t=>/Changes/.test(t.textContent)).click();

// 1. No history: no section.
{const {d,errors}=page(base);showChanges(d);
  assert.equal(d.getElementById('history').hidden,true,'hidden without a history');
  assert.deepEqual(errors.map(String),[]);}

// 2. With a history: collapsed, then a chart in four views.
const {w,d,errors}=page({...base,history});
showChanges(d);
const box=d.getElementById('history');
assert.equal(box.hidden,false,'shown with a history');
assert.equal(box.open,false,'collapsed by default');
assert.equal(d.querySelector('#history-chart svg'),null,'nothing drawn while collapsed');
box.open=true;box.dispatchEvent(new w.Event('toggle'));
const svg=()=>d.querySelector('#history-chart svg');
assert.ok(svg(),'drawn once opened');
assert.match(svg().getAttribute('aria-label'),/Questions with up to two premises: open share/);
assert.ok(svg().querySelector('path.main-line.live'),'this build is a dashed last step');
assert.match(d.querySelector('.history-legend').textContent,/this build, not yet published/);
assert.match(d.getElementById('history-note').textContent,/one point a day of main, then this build/);
const press=(attr,v)=>d.querySelector(`button[${attr}="${v}"]`).click();
press('data-history-measure','counts');
assert.match(svg().getAttribute('aria-label'),/questions and settled questions/);
assert.ok(svg().querySelector('path.settled-area')&&svg().querySelector('path.total'),'counts: settled area under the questions line');
assert.equal(d.querySelector('button[data-history-measure="counts"]').getAttribute('aria-pressed'),'true');
press('data-history-kind','core');
assert.match(svg().getAttribute('aria-label'),/^Core Questions: questions and settled questions/);
press('data-history-measure','share');
assert.match(svg().getAttribute('aria-label'),/^Core Questions: open share/);

// 3. A click on a day limits the Changes list to the records dated since the point before.
const hit=svg().querySelector('rect');
svg().getBoundingClientRect=()=>({left:0,top:0,width:280,height:220,right:280,bottom:220});
hit.dispatchEvent(new w.MouseEvent('click',{bubbles:true,clientX:200,clientY:100}));
const filter=d.getElementById('changes-filter');
assert.equal(filter.hidden,false,'a day filters the changes');
assert.match(filter.textContent,/Showing changes dated 3 Jan–5 Jan\./);
assert.deepEqual([...d.querySelectorAll('#results tr[data-id]')].map(tr=>tr.dataset.id),['b'],'only the records dated in that stretch');
filter.querySelector('button').click();
assert.equal(filter.hidden,true,'Show all clears the filter');
assert.equal(d.querySelectorAll('#results tr[data-id]').length,2);
assert.deepEqual(errors.map(String),[]);
console.log('PASS: Progress over time is hidden without a history, collapsed by default, switches between four views, dashes this build, and filters the Changes list by the stretch a day closes.');

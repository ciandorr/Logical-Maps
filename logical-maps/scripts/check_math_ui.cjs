// KaTeX in dynamically inserted prose, full write-ups, and all theme combinations.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {execFileSync} = require('node:child_process');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const prepared = JSON.parse(execFileSync('python3', ['-c', String.raw`
import json
from scripts.pmap import theme_head, load_topic, _md_to_html
p = next(p for p in load_topic('unbounded-utility')['principles'] if p['id']=='arroyo-value')
print(json.dumps({'head':theme_head('unbounded-utility',math_path=None),'principle':p,
 'writeup':_md_to_html(r'## Full proof'+'\n\n'+r'$$\int_0^\infty e^{-t}\,dt=1$$')}))
`], {cwd: root, encoding: 'utf8', maxBuffer: 2e6}));
const certificate = {source_id:'paper',lean:'none'};
const data = {
  topic:{id:'math',title:'Math',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]},
  principles:[prepared.principle, {id:'other',name:'Other',statement:String.raw`A $\frac{a}{b}$ and $x_{n+1}^2$.`,formal:String.raw`\(\forall x\,P(x)\)`,notes:String.raw`A note: $A\land B$.`}],
  results:[{id:'proof',premises:['other'],conclusion:'arroyo-value',status:'proved',certificate,proof:String.raw`Sum $\sum_{n=1}^{\infty}2^{-n}=1$.`,files:{html:'writeups/proof.html',handwritten:true}}],
  models:[{id:'model',name:'Model',satisfies:['other','arroyo-value'],violates:[],status:'proved',certificate,description:String.raw`Density $f(x)=\frac{1}{2}$.`}],
  background_html:String.raw`<p>Background $\Box\forall p\,(p\lor\neg p)$.</p>`,
  contribute_html:String.raw`<p>Example $a^2+b^2=c^2$.</p>`
};
const errors=[], vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(String(e)));
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const dom=new JSDOM('<!doctype html>'+template.replace('<!--__PMAP_THEME__-->',()=>prepared.head).replace('/*__PMAP_DATA__*/null',()=>JSON.stringify(data)),{
  runScripts:'dangerously',pretendToBeVisual:true,url:'https://maps.example/math/',virtualConsole:vc,
  beforeParse(w){w.fetch=()=>Promise.resolve({ok:true,text:()=>Promise.resolve(prepared.writeup)});}
});
const w=dom.window,d=w.document;
const count=selector=>d.querySelectorAll(selector+' .katex').length;
(async()=>{
  await new Promise(r=>d.addEventListener('DOMContentLoaded',r,{once:true}));
  assert.ok(count('#background'));assert.ok(count('#contribute'));
  const graph=d.getElementById('graph').innerHTML;
  w.select({type:'principle',id:'arroyo-value'});
  assert.ok(d.querySelector('#pop .mfrac'),'Arroyo denominator is a fraction');
  assert.ok(d.querySelector('#pop .msupsub'),'Arroyo power is a superscript');
  assert.ok(d.querySelector('#pop math annotation[encoding="application/x-tex"]'),'Accessible MathML includes source TeX');
  const once=count('#pop');w.renderSubscripts(d.getElementById('pop'));
  assert.equal(count('#pop'),once,'Repeated rendering is idempotent');
  w.select({type:'principle',id:'other'},true);
  assert.ok(count('#pop .selected-principles') || count('#pop'),'Multiple-selection definitions render');
  w.openPage({type:'principle',id:'other'});
  assert.ok(count('#page .statement'));assert.ok(count('#page .formal'));
  w.openPage({type:'model',id:'model'});assert.ok(d.querySelector('#page .mfrac'));
  w.openPage({type:'result',id:'proof'});
  assert.ok(count('#page .record-summary'),'Summary renders immediately');
  await new Promise(r=>setTimeout(r,50));
  assert.ok(count('#page .writeup'),'Fetched write-up renders after insertion');
  assert.match(d.querySelector('#page .writeup annotation').textContent,/\\int/);
  const mathHTML=d.querySelector('#page .writeup').innerHTML;
  for(let i=0;i<4;i++){
    d.querySelector(i%2?'[data-theme-toggle]':'[data-colourblind-toggle]').click();
    assert.equal(d.querySelector('#page .writeup').innerHTML,mathHTML,'Theme switches preserve formula markup');
  }
  const fixture=d.createElement('div');
  fixture.innerHTML=String.raw`<pre>$x^2$</pre><code>\(a_b\)</code><p>\(\notACommand\)</p><p>$\text{&lt;img src=x onerror=alert(1)&gt;}$</p>`;
  d.body.append(fixture);w.renderMapMath(fixture);
  assert.equal(fixture.querySelector('pre').textContent,'$x^2$');assert.equal(fixture.querySelector('code').textContent,String.raw`\(a_b\)`);
  assert.ok(fixture.querySelector('.katex-error')||fixture.textContent.includes(String.raw`\notACommand`),'Invalid TeX stays readable');
  assert.equal(fixture.querySelectorAll('img').length,0,'Mathematical text cannot inject HTML');
  assert.equal(d.querySelectorAll('#graph .katex').length,0,'Graph labels stay SVG text');
  assert.ok(graph.includes('<text'));
  assert.equal(d.querySelectorAll('#page .katex-error').length,0);
  assert.deepEqual(errors,[]);
  console.log('PASS: KaTeX definitions, multi-selection, summaries, fetched proofs, themes, accessibility and literal code.');
})().then(()=>w.close()).catch(e=>{console.error(e);w.close();process.exit(1);});

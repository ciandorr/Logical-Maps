// NODE_PATH=/path/to/node_modules node scripts/check_hasse_layout_ui.cjs
// The graph is a strength diagram: ⊥ is the floor, stronger principles sit
// lower, every implication arrow ascends, an ∧ hangs beneath its premises
// (or inside the box it is equivalent to), and inconsistent principles
// belong to the False box. Checked on fixtures and on
// the real topics in every graph mode.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
function page(data,url='https://maps.example/'){const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(data)),{url,runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});pages.push(dom);return dom;}
const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture',checked_by:[]});
const rule=(id,premises,conclusion,status='proved',source='paper')=>({id,premises,conclusion,status,certificate:cert(source),sources:['Fixture'],source_names:['Fixture']});
const topic={id:'hasse',title:'Hasse fixture',background:[],source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'},{id:'draft',name:'Draft',kind:'misc'}]};
const principles=ids=>ids.map(id=>({id,name:id.toUpperCase(),statement:id}));
function geometry(dom){
  return JSON.parse(dom.window.eval(`JSON.stringify((()=>{const L=layout;
    const markers=new Map([...document.querySelectorAll('#graph .edge-g')].map(g=>[g.dataset.segment,g.querySelector('.edge').getAttribute('marker-end')||'']));
    const node=id=>({id,kind:L.byId.get(id).kind,members:L.byId.get(id).members||[],meet:!!L.byId.get(id).meet,parent:L.byId.get(id).parent||null,x:L.x.get(id),y:L.y.get(id),h:L.size.get(id).h,
      fromBackground:!!(L.byId.get(id).members||[]).length&&L.byId.get(id).members.every(literalFollows)});
    return {nodes:L.visible.map(n=>node(n.id)),edges:L.edges.map(e=>({id:e.id,from:e.from,to:e.to,toJunction:!!e.toJunction,fromJunction:!!e.fromJunction,conjectural:!!(e.conjectured||e.r?.status==='conjectured'),converse:e.converse||null,marker:e.toJunction?null:markers.get(e.id)})),
      back:[...L.back],bands:L.bands.map(b=>b.label),labels:[...document.querySelectorAll('#graph .layer-label')].map(t=>t.textContent)};})())`));
}
const byId=g=>new Map(g.nodes.map(n=>[n.id,n]));
const classNode=(g,id)=>g.nodes.find(n=>n.members.includes(id));
function verifyDirections(g,label){
  const N=byId(g);
  assert.deepEqual(g.back,[],`${label}: every segment follows the convention`);
  for(const e of g.edges){
    const from=N.get(e.from),to=N.get(e.to);
    const descends=e.toJunction||e.to==='falsity'||(e.fromJunction&&from.meet&&!from.parent);
    assert.ok(descends?from.y<to.y:from.y>to.y,`${label}: ${e.id} must ${descends?'descend':'ascend'}`);
  }
  const falsity=g.nodes.find(n=>n.kind==='falsity');
  const connected=g.nodes.filter(n=>n.parent||n.kind==='falsity'||n.kind==='truth'||g.nodes.some(j=>j.parent===n.id)||g.edges.some(e=>e.from===n.id||e.to===n.id));
  if(falsity) for(const n of connected) if(n!==falsity) assert.ok(n.y<falsity.y,`${label}: ⊥ is the lowest node (${n.id})`);
  const isolated=g.nodes.filter(n=>!connected.includes(n));
  if(isolated.length&&connected.length){
    const top=Math.min(...connected.map(n=>n.y-n.h/2));
    for(const n of isolated) assert.ok(n.y+n.h/2<top,`${label}: isolated ${n.id} sits above the diagram`);
    const background=isolated.filter(n=>n.fromBackground),unconnected=isolated.filter(n=>!n.fromBackground);
    if(background.length&&unconnected.length) assert.ok(Math.max(...unconnected.map(n=>n.y))<Math.min(...background.map(n=>n.y)),`${label}: background consequences sit nearest the diagram`);
    assert.deepEqual(g.labels,g.bands,`${label}: every band is labelled`);
    if(background.length) assert.ok(g.labels.includes('Follows from the background'));
    if(unconnected.length&&g.edges.length) assert.ok(g.labels.includes('No displayed arrows'));
  }
  // Principles that collapse into ⊥ sit in the bottom principle row unless
  // another collapsing principle implies them.
  if(falsity){
    const bottom=Math.max(...connected.filter(n=>n.kind==='class').map(n=>n.y));
    const collapsing=new Set(g.edges.filter(e=>e.to==='falsity'&&!e.conjectural&&N.get(e.from).kind==='class').map(e=>e.from));
    for(const id of collapsing){
      const impliedByCollapsing=g.edges.some(e=>e.to===id&&collapsing.has(e.from));
      assert.ok(impliedByCollapsing||Math.abs(N.get(id).y-bottom)<1e-6,`${label}: ${id} collapses into ⊥ and stays beside it`);
    }
  }
  // Every ∧ is directly beneath the lowest principle it connects, or, as a meet, directly above its conclusion.
  for(const j of g.nodes.filter(n=>n.kind==='junction')){
    if(j.parent) { const box=N.get(j.parent); assert.ok(j.y-j.h/2>box.y-box.h/2&&j.y+j.h/2<box.y+box.h/2,`${label}: ∧ is inside its equivalence box`); }
    const premises=g.edges.filter(e=>e.to===j.id&&e.toJunction).map(e=>N.get(e.from));
    const conclusions=g.edges.filter(e=>e.from===j.id).map(e=>N.get(e.to)).filter(n=>n.kind!=='falsity');
    for(const p of premises) assert.ok(j.y>p.y,`${label}: ∧ ${j.id} below premise ${p.id}`);
    for(const c of conclusions) assert.ok(j.meet&&!j.parent?j.y<c.y:j.y>c.y,`${label}: ∧ ${j.id} ${j.meet?'above':'below'} conclusion ${c.id}`);
  }
}
try{
  // The cycle that confused the old layering: A ⇒ B and B ∧ C ⇒ A.
  const cycle={topic,principles:principles(['a','b','c']),models:[],results:[rule('ab',['a'],'b'),rule('bca',['b','c'],'a')]};
  const g1=geometry(page(cycle));
  verifyDirections(g1,'cycle');
  const a=classNode(g1,'a'),b=classNode(g1,'b'),c=classNode(g1,'c'),j=g1.nodes.find(n=>n.kind==='junction');
  assert.ok(a.y>b.y,'A ⇒ B puts A below B');
  assert.ok(j.y>a.y&&j.y>b.y&&j.y>c.y,'B ∧ C hangs beneath every principle it connects');
  assert.ok(!j.meet);

  // A meet: P ⇒ S, P ⇒ T and S ∧ T ⇒ P. The ∧ sits directly above P.
  const meet={topic,principles:principles(['p','s','t']),models:[],results:[rule('ps',['p'],'s'),rule('pt',['p'],'t'),rule('stp',['s','t'],'p')]};
  const g2=geometry(page(meet));
  verifyDirections(g2,'meet');
  const jm=g2.nodes.find(n=>n.kind==='junction');
  assert.ok(jm.meet,'S ∧ T is the meet of S and T');
  assert.ok(jm.y<classNode(g2,'p').y&&jm.y>classNode(g2,'s').y&&jm.y>classNode(g2,'t').y);

  // Collapse into ⊥: a proved refutation pins its principle beside the floor;
  // a conjectured one does not.
  const falsity={topic,principles:principles(['x','y','z','w','v']),models:[],results:[
    rule('xf',['x'],false),rule('yz',['y'],'z'),rule('zw',['z'],'w'),rule('vw',['v'],'w'),rule('vf',['v'],false,'conjectured','draft')]};
  const dom3=page(falsity);
  const g3=geometry(dom3);
  verifyDirections(g3,'falsity');
  const floor=g3.nodes.find(n=>n.kind==='falsity');
  assert.ok(floor,'⊥ is drawn');
  assert.ok(classNode(g3,'x').y>classNode(g3,'y').y,'X collapses into ⊥ and sits beneath the consistent chain');
  assert.equal(classNode(g3,'x').id,'falsity','A proved refutation belongs inside False');
  assert.equal(g3.edges.filter(e=>e.to==='falsity').length,0,'No internal collapse arrow is drawn');
  dom3.window.document.getElementById('show-conj').click();
  const g3c=geometry(dom3);
  verifyDirections(g3c,'falsity+conjectures');
  assert.ok(g3c.edges.some(e=>e.to==='falsity'&&e.conjectural),'The conjectured refutation is drawn');
  assert.ok(Math.abs(classNode(g3c,'v').y-classNode(g3c,'x').y)>1e-6,'A conjectured refutation does not pin V beside ⊥');

  // A rule whose conclusion the background rules out is drawn into ⊥, and
  // the collapsing principle stays pinned beside the floor even when the
  // source of the refutation is filtered out of the arrows.
  const hidden={topic,principles:principles(['h','i','k']),models:[],results:[rule('hi',['h'],'i'),rule('if',['i'],false,'proved','draft'),rule('hk',['h'],'k')]};
  const dom4=page(hidden);
  dom4.window.eval("state.excluded.add('i');refreshPrincipleControls();renderAll(true)");
  let g4=geometry(dom4);
  verifyDirections(g4,'hidden intermediate');
  const collapse=g4.edges.find(e=>e.to==='falsity');
  assert.equal(classNode(g4,'h').id,'falsity','H joins False while its refuted intermediate I is hidden');
  dom4.window.document.querySelector('[data-source-filter="draft"]').click();
  g4=geometry(dom4);
  verifyDirections(g4,'hidden intermediate, source off');
  assert.equal(classNode(g4,'h').id,'falsity','Source selection preserves the background refutation');
  assert.ok(dom4.window.document.querySelector('#graph .node.ruled-out'),'The background still rules H out');
  assert.ok(classNode(g4,'h').y>classNode(g4,'k').y,'H stays pinned beneath its consequence');

  // Transitive reduction hides implied arrows without moving anything, and
  // never a proved arrow on the strength of a conjecture.
  const chain={topic,principles:principles(['d','e','f','g']),models:[],results:[rule('de',['d'],'e'),rule('ef',['e'],'f'),rule('dg',['d'],'g'),rule('gf',['g'],'f','conjectured','draft')]};
  const dom5=page(chain);
  dom5.window.document.getElementById('show-conj').click();
  const before=geometry(dom5);
  verifyDirections(before,'chain');
  const positions=g=>Object.fromEntries(g.nodes.map(n=>[n.id,[n.x,n.y]]));
  dom5.window.document.getElementById('reduce-arrows').click();
  const reduced=geometry(dom5);
  assert.deepEqual(positions(reduced),positions(before),'Reduction does not move nodes');
  const arrow=(g,from,to)=>g.edges.find(e=>e.from===classNode(g,from).id&&e.to===classNode(g,to).id);
  assert.ok(arrow(before,'d','f')&&!arrow(reduced,'d','f'),'D ⇒ F is implied by D ⇒ E ⇒ F');
  assert.ok(arrow(reduced,'d','e')&&arrow(reduced,'e','f'));
  assert.ok(!arrow(reduced,'g','f')||arrow(reduced,'g','f').conjectural,'The conjecture G ⇒ F stays only as itself');
  const proved={topic,principles:principles(['d','e','f']),models:[],results:[rule('de',['d'],'e','conjectured','draft'),rule('ef',['e'],'f'),rule('df',['d'],'f')]};
  const dom6=page(proved);
  dom6.window.document.getElementById('show-conj').click();dom6.window.document.getElementById('reduce-arrows').click();
  assert.ok(arrow(geometry(dom6),'d','f'),'A proved arrow is never hidden through a conjectural chain');
  dom5.window.document.getElementById('reduce-arrows').click();
  assert.deepEqual(geometry(dom5).edges.map(e=>e.id).sort(),before.edges.map(e=>e.id).sort(),'Turning reduction off restores every arrow');

  // Hollow arrowheads mark open converses; a model-refuted converse is filled.
  const heads={topic,principles:principles(['m','n','o']),models:[{id:'w',name:'Witness',status:'proved',satisfies:['n'],violates:['m'],certificate:cert('paper'),sources:['Fixture'],source_names:['Fixture']}],results:[rule('mn',['m'],'n'),rule('on',['o'],'n')]};
  const g7=geometry(page(heads));
  const mn=arrow(g7,'m','n'),on=arrow(g7,'o','n');
  assert.equal(mn.converse,'refuted');assert.match(mn.marker,/url\(#arr-[^)]+\)$/);assert.ok(!mn.marker.includes('-open'));
  assert.equal(on.converse,'open');assert.ok(on.marker.includes('-open'),'Converse open draws a hollow head');

  // Real topics, every graph mode.
  for(const t of ['unbounded-utility','intuitionisticism']){
    const file=path.join(root,'build',t,'data.json');
    if(!fs.existsSync(file)) continue;
    const data=JSON.parse(fs.readFileSync(file,'utf8'));
    const modes=[['default',''],['no background','?assume='],['DTU',"addBackgroundPreset('dtu')"],['conjectures',"document.getElementById('show-conj').click()"],
      ['conjectures only',"document.getElementById('conjecture-only').click()"],['negatives',"state.negativeShown=new Set(ids);refreshPrincipleControls();renderAll(true)"],['reduced',"document.getElementById('reduce-arrows').click()"],['trivial',"document.getElementById('trivial-arrows').click()"]];
    for(const [label,setup] of modes){
      if(label==='DTU'&&t!=='unbounded-utility') continue;
      const dom=page(data,'https://maps.example/'+(setup.startsWith('?')?setup:''));
      if(setup&&!setup.startsWith('?')) dom.window.eval(setup);
      const g=geometry(dom);
      verifyDirections(g,`${t} ${label}`);
      assert.ok(g.nodes.length>0);
      dom.window.close();
    }
  }
  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: floor at the bottom, ascending arrows, conjunctions inside equivalence boxes, grouped collapses, labelled bands, hollow heads, and an immobile transitive reduction on fixtures and real topics.');
}finally{pages.forEach(p=>p.window.close());}

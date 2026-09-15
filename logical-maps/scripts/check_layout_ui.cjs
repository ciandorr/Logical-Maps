// Run with Node and jsdom available (e.g. NODE_PATH=/path/to/node_modules).
// The actual-topic checks use the latest build/unbounded-utility/data.json.
const fs = require('node:fs'), path = require('node:path'), assert = require('node:assert/strict');
const {JSDOM, VirtualConsole} = require('jsdom');
const root = path.resolve(__dirname, '..');
const template = fs.readFileSync(path.join(root, 'viewer/template.html'), 'utf8');
const pages = [], errors = [], EPS = 1e-7;

function page(data, url = 'http://localhost/?assume=') {
  const console = new VirtualConsole();
  console.on('jsdomError', error => errors.push(error));
  const dom = new JSDOM(template.replace('/*__PMAP_DATA__*/null', JSON.stringify(data)), {
    url, runScripts: 'dangerously', pretendToBeVisual: true, virtualConsole: console,
  });
  pages.push(dom);
  return dom;
}
function geometry(dom) {
  return JSON.parse(dom.window.eval(`JSON.stringify((() => {
    const L = layout, g = buildGraph();
    if (!L) return null;
    const edges = L.edges.map(e => ({id:e.id, from:e.from, to:e.to}));
    return {
      nodes:L.visible.map(n => {
        const size=L.size.get(n.id), x=L.x.get(n.id), y=L.y.get(n.id);
        return {id:n.id, kind:n.kind, parent:n.parent||null, members:n.members || [], x,y,
          left:x-size.w/2, right:x+size.w/2, top:y-size.h/2, bottom:y+size.h/2,
          connected:!!n.parent||n.kind==='falsity'||n.kind==='truth'||!!n.junctions?.length||edges.some(e => e.from===n.id || e.to===n.id)};
      }), edges,
      rawNodes:g.nodes.map(n => ({id:n.id,kind:n.kind,parent:n.parent||null,junctions:n.junctions?.length||0})),
      layoutEdges:(g.layoutEdges||[]).map(e=>({from:e.from,to:e.to})),
      rawEdges:g.edges.map(e => ({id:e.id,from:e.from,to:e.to})),
      showIso:state.showIso, order:principleOrder(), ids:[...ids],
    };
  })())`));
}
function bounds(nodes) {
  assert.ok(nodes.length, 'Bounds need a nonempty collection.');
  return {left:Math.min(...nodes.map(n=>n.left)), right:Math.max(...nodes.map(n=>n.right)),
    top:Math.min(...nodes.map(n=>n.top)), bottom:Math.max(...nodes.map(n=>n.bottom))};
}
function overlaps(a,b) {
  return Math.min(a.right,b.right)-Math.max(a.left,b.left)>EPS &&
    Math.min(a.bottom,b.bottom)-Math.max(a.top,b.top)>EPS;
}
function distance(a,b) {
  return Math.hypot(Math.max(a.left-b.right,b.left-a.right,0), Math.max(a.top-b.bottom,b.top-a.bottom,0));
}
function verifyMembership(g) {
  assert.ok(g, 'The fixture background must remain consistent.');
  const expected = g.rawNodes.filter(n => g.showIso || n.kind==='junction' || n.kind==='falsity' || n.kind==='truth' || n.junctions ||
    g.rawEdges.some(e=>e.from===n.id||e.to===n.id)).map(n=>n.id).sort();
  assert.deepEqual(g.nodes.map(n=>n.id).sort(), expected, 'Layout must retain every eligible graph node.');
  const visible = new Set(expected);
  assert.deepEqual(g.edges, g.rawEdges.filter(e=>visible.has(e.from)&&visible.has(e.to)), 'Packing must not change graph edges.');
  assert.deepEqual([...g.order].sort(), [...g.ids].sort(), 'Principle ordering must retain hidden and grouped members exactly once.');
  for (const n of g.nodes) for (const coordinate of ['x','y','left','right','top','bottom'])
    assert.ok(Number.isFinite(n[coordinate]), `${n.id} has an invalid ${coordinate}.`);
}
function verifyIsolation(g, requireIsolates=true) {
  verifyMembership(g);
  const isolated=g.nodes.filter(n=>!n.connected), core=g.nodes.filter(n=>n.connected);
  if (requireIsolates) assert.ok(isolated.length, 'This fixture must exercise isolated nodes.');
  for(let i=0;i<isolated.length;i++) {
    for(let j=i+1;j<isolated.length;j++) assert.ok(!overlaps(isolated[i],isolated[j]), `Isolated nodes overlap: ${isolated[i].id}, ${isolated[j].id}.`);
    for(const n of core) assert.ok(!overlaps(isolated[i],n), `An isolated node overlaps the connected graph: ${isolated[i].id}, ${n.id}.`);
  }
  if(isolated.length&&core.length) {
    const a=bounds(isolated), b=bounds(core);
    assert.ok(!overlaps(a,b), 'The isolated collection must sit outside the connected graph bounds.');
    assert.ok(distance(a,b)<=150, `Isolated collection is too far from the graph: ${distance(a,b)}.`);
  }
  return {isolated,core};
}
function toggleIsolated(dom) { dom.window.document.getElementById('show-iso').click(); }
function verifyStableCore(dom, requireIsolates=true) {
  const before=geometry(dom), {core}=verifyIsolation(before,requireIsolates);
  toggleIsolated(dom);
  const hidden=geometry(dom);
  verifyMembership(hidden);
  assert.ok(hidden.nodes.every(n=>n.connected), 'Show isolated off must remove all isolated nodes.');
  assert.deepEqual(hidden.edges,before.edges);
  assert.deepEqual(hidden.nodes.map(n=>n.id).sort(),core.map(n=>n.id).sort());
  for(const n of core) {
    const other=hidden.nodes.find(m=>m.id===n.id);
    assert.ok(Math.abs(n.x-other.x)<EPS&&Math.abs(n.y-other.y)<EPS,
      `Toggling isolated nodes moved connected node ${n.id}.`);
  }
  toggleIsolated(dom);
  const restored=geometry(dom);
  verifyIsolation(restored,requireIsolates);
  assert.deepEqual(restored.nodes,before.nodes, 'Restoring isolated nodes must restore deterministic geometry.');
}

const cert=source_id=>({source_id,lean:'none',produced_by:'Fixture author',checked_by:[]});
const rule=(id,from,to,source='paper')=>({id,premises:[from],conclusion:to,status:'proved',certificate:cert(source)});
function fixture(count,{chain=true,longNames=false,tall=false}={}) {
  const ids=[...(chain?['a','b']:[]),...Array.from({length:count},(_,i)=>`i${i}`),
    ...(tall?Array.from({length:12},(_,i)=>`q${i}`):[])];
  return {
    topic:{id:'layout-fixture',title:'Layout fixture',background:[],source_catalog:[
      {id:'paper',name:'A paper',kind:'published-paper'},
      {id:'submission',name:'A submission',kind:'online-submission'},
    ]},
    principles:ids.map(id=>({id,name:longNames&&id.startsWith('i')?`A long standalone principle with a descriptive name ${id}`:id.toUpperCase(),statement:`Principle ${id}`})),
    results:[...(chain?[rule('ab','a','b')]:[]),
      ...(tall?Array.from({length:11},(_,i)=>[rule(`q-forward-${i}`,'q0',`q${i+1}`),rule(`q-back-${i}`,`q${i+1}`,'q0')]).flat():[])],
    models:[],
  };
}

function components(g) {
  const remaining=new Set(g.nodes.filter(n=>n.connected).map(n=>n.id)), groups=[];
  while(remaining.size) {
    const ids=[remaining.values().next().value]; remaining.delete(ids[0]);
    for(let i=0;i<ids.length;i++)for(const e of [...g.edges,...g.layoutEdges,...g.nodes.filter(n=>n.parent).map(n=>({from:n.id,to:n.parent}))]) {
      const next=e.from===ids[i]?e.to:e.to===ids[i]?e.from:null;
      if(remaining.delete(next))ids.push(next);
    }
    groups.push(g.nodes.filter(n=>ids.includes(n.id)));
  }
  return groups;
}
function clusterFixture(count) {
  const data=fixture(5,{chain:false});
  for(let i=0;i<count;i++) {
    const length=2+i%5;
    for(let j=0;j<length;j++) {
      const id=`c${i}-${j}`;
      data.principles.push({id,name:j%2?`A longer principle in separate cluster ${i}, step ${j}`:id,statement:id});
      if(j)data.results.push(rule(`r${i}-${j}`,`c${i}-${j-1}`,id));
    }
  }
  return data;
}

try {
  // Multiple chains of very different widths/depths used to share layers and
  // repel one another. Each cluster now keeps its own compact coordinates.
  for(const count of [2,6,15]) {
    const dom=page(clusterFixture(count)), g=geometry(dom);
    verifyIsolation(g);
    const groups=components(g), boxes=groups.map(bounds);
    assert.equal(groups.length,count);
    for(let i=0;i<boxes.length;i++) {
      for(let j=i+1;j<boxes.length;j++)assert.ok(!overlaps(boxes[i],boxes[j]),'Separate clusters overlap');
      const nearest=Math.min(...boxes.filter((_,j)=>j!==i).map(b=>distance(boxes[i],b)));
      assert.ok(nearest<=100,`Cluster ${i} is stranded ${nearest} units away`);
      const widest=Math.max(...groups[i].map(n=>n.right-n.left));
      assert.ok(boxes[i].right-boxes[i].left<=widest+EPS,'Other clusters stretched a simple chain');
    }
    verifyStableCore(dom);
  }
  // Real backgrounds used to strand one large equivalence class thousands of
  // layout units away from the connected graph, shrinking everything at fit.
  const data=JSON.parse(fs.readFileSync(path.join(root,'build/unbounded-utility/data.json'),'utf8'));
  const du=data.topic.background_presets.find(p=>p.id==='du').principles;
  for(const assumptions of [null,[...du,'totality'],[...du,'l1-continuity','symmetric-neutrality']]) {
    const url=assumptions===null?'http://localhost/':`http://localhost/?assume=${assumptions.join(',')}`;
    verifyStableCore(page(data,url),false);
  }

  // A connected DTU graph can also drift apart: repeated one-way overlap
  // correction used to leave a 1,500-unit gap between its two branches.
  const dtu=page(data);
  dtu.window.eval(`addBackgroundPreset('dtu');
    state.excluded=new Set([...P.filter(p=>p.category==='basic-decision-theory').map(p=>p.id),
      'independent-sum-preservation','shift-invariance']);
    state.negativeShown.clear();refreshPrincipleControls();renderAll(true);`);
  const selected=geometry(dtu);
  verifyMembership(selected);
  assert.equal(components(selected).length,1, 'Exercise a connected graph, not component packing.');
  const connected=selected.nodes.filter(n=>n.connected), selectedBounds=bounds(connected);
  const rows=[...new Set(connected.map(n=>n.y))].map(y=>connected.filter(n=>n.y===y).sort((a,b)=>a.x-b.x));
  const widestPackedRow=Math.max(...rows.map(row=>row.reduce((sum,n)=>sum+n.right-n.left,0)+28*(row.length-1)));
  assert.ok(selectedBounds.right-selectedBounds.left<=1.5*widestPackedRow,
    'Straightening must not stretch this connected graph far beyond the width its rows need.');
  for(const row of rows.map(row=>row.filter(n=>!n.parent))) for(let i=1;i<row.length;i++)
    assert.ok(row[i].left-row[i-1].right>=28-EPS, 'Compaction must preserve space between boxes.');
  dtu.window.eval('renderAll(true)');
  assert.deepEqual(geometry(dtu).nodes,selected.nodes, 'Repeated rendering must not drift.');

  // Small connected cores, numerous isolates and long names must remain close
  // without overlaps or the old single extremely wide row.
  for(const options of [{count:8},{count:30},{count:12,longNames:true},{count:15,tall:true,longNames:true}]) {
    const dom=page(fixture(options.count,options));
    const g=geometry(dom), {isolated}=verifyIsolation(g);
    const box=bounds(isolated), widest=Math.max(...isolated.map(n=>n.right-n.left));
    assert.ok(box.right-box.left<=Math.max(1400,widest+EPS), 'The isolated collection must wrap to a bounded width.');
    assert.ok(new Set(isolated.map(n=>n.y)).size>1, 'Numerous isolated nodes must occupy multiple rows.');
    if(options.tall) assert.ok(isolated.some(n=>n.members.length===12&&n.bottom-n.top>200), 'Exercise the actual height of a tall equivalence class.');
    verifyStableCore(dom);
  }

  // No edges: packing needs no connected anchor, and hiding isolates leaves a
  // valid empty graph rather than invalid coordinates or a phantom node.
  const all=page(fixture(32,{chain:false}));
  const allGeometry=geometry(all), {isolated}=verifyIsolation(allGeometry);
  assert.equal(allGeometry.edges.length,0);
  assert.equal(isolated.length,32);
  const box=bounds(isolated);
  assert.ok(box.right-box.left<=1200, 'The all-isolated graph must wrap, instead of retaining its old 3428-unit row.');
  assert.ok(box.bottom-box.top<=1200, 'The all-isolated graph must remain reasonably compact vertically too.');
  assert.ok(new Set(isolated.map(n=>n.y)).size>1);
  toggleIsolated(all);
  const empty=geometry(all);
  verifyMembership(empty);
  assert.deepEqual(empty.nodes,[]);
  assert.deepEqual(empty.edges,[]);
  assert.equal(all.window.document.querySelectorAll('#graph .node,#graph .junction,#graph .edge').length,0);
  toggleIsolated(all);
  assert.deepEqual(geometry(all).nodes,allGeometry.nodes);

  // Filtering a source or changing the background can turn connected nodes
  // into isolates. Their presentation must follow the current graph topology.
  const changing=fixture(5);
  changing.principles.push({id:'c',name:'C',statement:'Principle c'});
  changing.results.push(rule('bc','b','c','submission'));
  const dom=page(changing), doc=dom.window.document;
  const initial=geometry(dom);
  verifyIsolation(initial);
  doc.querySelector('[data-source-filter="submission"]').click();
  const filtered=geometry(dom);
  verifyIsolation(filtered);
  assert.equal(initial.edges.length,3, 'A ⇒ B ⇒ C also displays A ⇒ C.');
  assert.equal(filtered.edges.length,1, 'Removing B ⇒ C also removes the transitive A ⇒ C.');
  assert.ok(filtered.nodes.some(n=>n.members.includes('c')&&!n.connected));
  doc.querySelector('[data-source-filter="paper"]').click();
  assert.equal(geometry(dom).edges.length,0);
  verifyIsolation(geometry(dom));
  doc.querySelector('[data-source-filter="paper"]').click();
  doc.querySelector('[data-source-filter="submission"]').click();
  assert.deepEqual(geometry(dom).nodes,initial.nodes);
  dom.window.eval("changeBackground('b',true)");
  const assumed=geometry(dom);
  verifyIsolation(assumed);
  assert.ok(!assumed.nodes.some(n=>n.members.includes('b')), 'The assumed principle should leave the graph.');
  assert.equal(assumed.edges.length,0);
  dom.window.eval("changeBackground('b',false)");
  assert.deepEqual(geometry(dom).nodes,initial.nodes);
  assert.deepEqual(geometry(dom).edges,initial.edges);
  assert.deepEqual(errors,[]);
  console.log('PASS: compact isolated-node layout, stable connected geometry, long and tall nodes, empty graphs, topology changes, and complete principle ordering.');
} finally { pages.forEach(dom=>dom.window.close()); }

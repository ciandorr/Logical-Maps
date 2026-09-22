// NODE_PATH=/path/to/node_modules node scripts/check_categories_ui.cjs
// Principle categories are collapsible in the three lists that show them: the
// graph sidebar, the lattice sidebar and the theory explorer. One collapsed
// set serves all three. A long list starts closed, a short one starts open.
const fs=require('node:fs'),path=require('node:path'),assert=require('node:assert/strict');
const {JSDOM,VirtualConsole}=require('jsdom');
const root=path.resolve(__dirname,'..');
const template=fs.readFileSync(path.join(root,'viewer/template.html'),'utf8');
const pages=[],errors=[];
const cert={source_id:'paper',lean:'none',produced_by:'Fixture',checked_by:[]};
const categories=[{id:'one',name:'Group one'},{id:'two',name:'Group two'}];
// Distinct stems so the graph search can pick one group out.
const members=(n,stem,category)=>Array.from({length:n},(_,i)=>({id:`${stem}${i}`,name:`${stem==='alpha'?'Alpha':'Beta'} ${i}`,statement:'Statement',category}));
const topic=principle_categories=>({id:'cat',title:'Category fixture',background:[],principle_categories,source_catalog:[{id:'paper',name:'Paper',kind:'published-paper'}]});
const data=(perGroup,principle_categories=categories)=>({topic:topic(principle_categories),
  principles:[...members(perGroup,'alpha','one'),...members(perGroup,'beta','two')],
  results:[{id:'r',premises:['alpha0'],conclusion:'beta0',status:'proved',certificate:cert,sources:['Fixture'],source_names:['Fixture']}],
  models:[]});
function page(fixture){
  const vc=new VirtualConsole();vc.on('jsdomError',e=>errors.push(e));
  const dom=new JSDOM(template.replace('/*__PMAP_DATA__*/null',JSON.stringify(fixture)),
    {url:'https://maps.example/',runScripts:'dangerously',pretendToBeVisual:true,virtualConsole:vc});
  pages.push(dom);return dom;
}
const lists={graph:'#pr-filters',lattice:'#lat-filters',explorer:'#model-principles'};
try{
  // Eight principles over two categories: short enough to read whole.
  {
    const d=page(data(4)).window.document;
    for (const [view,selector] of Object.entries(lists))
      assert.ok([...d.querySelectorAll(`${selector} details[data-category]`)].every(g=>g.open),`A short list opens in the ${view}`);
  }
  // The threshold counts the topic's principles, and the rule needs a choice
  // of category to be worth making.
  assert.ok([...page(data(8)).window.document.querySelectorAll('#pr-filters details[data-category]')].every(g=>g.open),
    'Sixteen principles is not yet long enough');
  assert.ok([...page(data(9)).window.document.querySelectorAll('#pr-filters details[data-category]')].every(g=>!g.open),
    'Eighteen is');
  assert.ok([...page(data(20,[])).window.document.querySelectorAll('#pr-filters details[data-category]')].every(g=>g.open),
    'A topic with no categories of its own has nothing to choose between, so its one list stays open');

  const dom=page(data(10)),w=dom.window,d=w.document;
  const state=view=>[...d.querySelectorAll(`${lists[view]} details[data-category]`)].map(g=>`${g.dataset.category}:${g.open?'open':'closed'}`);
  const summary=(view,category)=>d.querySelector(`${lists[view]} details[data-category="${category}"] > summary`);

  // Twenty principles over two categories: both start closed, and each
  // summary still reports its category by name and count.
  assert.deepEqual(state('graph'),['one:closed','two:closed'],'A long list starts closed');
  assert.equal(summary('graph','one').querySelector('h3').textContent,'Group one','The summary names the category');
  assert.equal(summary('graph','one').querySelector('.pr-category-count').textContent,'10/10','And counts it, closed or open');

  // The rows and the group's own controls sit inside the disclosure, which is
  // what makes the browser hide them; jsdom lays nothing out, so the contract
  // to assert here is the structure rather than a computed height.
  const group=d.querySelector('#pr-filters details[data-category="one"]');
  assert.equal(group.tagName,'DETAILS');
  assert.equal(group.firstElementChild.tagName,'SUMMARY','The summary comes first, so everything else is the hidden part');
  assert.equal(group.querySelectorAll('.pr-row').length,10,'Every row of the category is inside it');
  // What acts on the whole category stays in the summary, so a closed
  // category can still be shown or cleared without opening it first.
  assert.ok(group.querySelector('summary [data-category-select="all"]'),'Show positive is in the summary');
  assert.ok(group.querySelector('summary [data-category-select="none"]'),'And so is clear');

  const click=el=>el.dispatchEvent(new w.MouseEvent('click',{bubbles:true,cancelable:true}));

  // A control in the summary acts on the category without opening it.
  const shown=stem=>[...d.querySelectorAll(`#pr-filters [data-show-positive^="${stem}"]`)].filter(b=>b.getAttribute('aria-pressed')==='true').length;
  assert.equal(shown('alpha'),10,'Every principle starts on the graph');
  click(group.querySelector('summary [data-category-select="none"]'));
  assert.equal(shown('alpha'),0,'Clear empties the category');
  assert.equal(shown('beta'),10,'And leaves the other alone');
  assert.deepEqual(state('graph'),['one:closed','two:closed'],'Without opening anything');
  click(group.querySelector('summary [data-category-select="all"]'));
  assert.equal(shown('alpha'),10,'Show positive puts them back');
  assert.deepEqual(state('graph'),['one:closed','two:closed'],'Still closed');
  const latGroup=d.querySelector('#lat-filters details[data-category="one"]');
  click(latGroup.querySelector('summary [data-lat-select="all"]'));
  assert.equal(w.eval('lattice.shown.length'),10,'The lattice chooses a closed category the same way');
  assert.deepEqual(state('lattice'),['one:closed','two:closed'],'Also without opening it');
  click(latGroup.querySelector('summary [data-lat-select="none"]'));
  assert.equal(w.eval('lattice.shown.length'),0);

  // Opening one category opens it everywhere, since the three lists share one
  // collapsed set, and leaves the others alone.
  click(summary('graph','one'));
  assert.deepEqual(state('graph'),['one:open','two:closed'],'Clicking a summary opens that category');
  assert.deepEqual(state('lattice'),['one:open','two:closed'],'The lattice agrees');
  assert.deepEqual(state('explorer'),['one:open','two:closed'],'And so does the theory explorer');
  assert.ok(!w.eval('state.collapsed.has("one")'),'The shared set is what changed');
  click(summary('lattice','two'));
  assert.deepEqual(state('graph'),['one:open','two:open'],'A summary in another list works the same way');
  click(summary('explorer','two'));
  assert.deepEqual(state('graph'),['one:open','two:closed'],'Clicking again closes it');

  // These lists are rebuilt wholesale on most changes. The disclosure is
  // driven from the shared set, so a rebuild opens them as the reader left them.
  w.eval('renderAll(true)');
  assert.deepEqual(state('graph'),['one:open','two:closed'],'A rebuild keeps the graph list as it was');
  assert.deepEqual(state('lattice'),['one:open','two:closed'],'And the lattice list');
  assert.deepEqual(state('explorer'),['one:open','two:closed'],'And the explorer list');

  // A closed category still reports the assumptions it holds, or collapsing
  // one would hide a choice the reader made.
  w.eval('changeBackground("beta0", true)');
  assert.deepEqual(state('explorer'),['one:open','two:closed'],'The category holding the new assumption is still closed');
  assert.equal(summary('explorer','two').querySelector('.pr-category-count').textContent,'1 assumed','And says so');
  assert.equal(summary('explorer','one').querySelector('.pr-category-count').textContent,'','A category with none says nothing');
  w.eval('changeBackground("beta0", false)');

  // Reaching a row inside a closed category opens it, as find-in-page does.
  click(summary('graph','one'));
  assert.deepEqual(state('graph'),['one:closed','two:closed'],'Both closed again');
  const input=d.getElementById('graph-search');
  input.value='Beta 3'; input.dispatchEvent(new w.Event('input',{bubbles:true}));
  assert.ok(d.querySelector('[data-pr-row="beta3"]').classList.contains('search-current'),'The search finds the row');
  assert.deepEqual(state('graph'),['one:closed','two:open'],'And opens the category it is in, leaving the other closed');

  assert.deepEqual(errors.map(String),[]);
  console.log('PASS: categories collapse in the graph sidebar, the lattice sidebar and the theory explorer, from one shared set; a long list starts closed and a short one open; rows sit inside the disclosure while the group\'s controls stay in the summary and work closed; a rebuild keeps the reader\'s choice; a closed category reports its count and its assumptions; and a search opens the category it lands in.');
}finally{pages.forEach(p=>p.window.close());}

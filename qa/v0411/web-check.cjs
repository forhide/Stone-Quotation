const {chromium}=require('playwright');
const {execFileSync}=require('node:child_process');
const fs=require('node:fs');
const assert=require('node:assert/strict');
const path=require('node:path');
const out=path.join(__dirname,'web-qa');fs.mkdirSync(out,{recursive:true});
const result={checks:[],errors:[],http_errors:[],screens:[],actual_phone:false};
function check(ok,label){assert(ok,label);result.checks.push(label);console.log('PASS: '+label);}
function ocr(file){return execFileSync('tesseract',[file,'stdout','--psm','11'],{encoding:'utf8',env:{...process.env,OMP_THREAD_LIMIT:'1'},stdio:['ignore','pipe','pipe']}).toLowerCase();}
async function shot(page,label){const file=path.join(out,label+'.png');await page.screenshot({path:file});result.screens.push(label+'.png');return ocr(file);}
async function screen(page,label,match){let text='';for(let i=0;i<12;i++){text=await shot(page,label);if(match(text))return text;await page.waitForTimeout(300);}assert.fail(label+': '+text);}
async function readVersion(page,label){
 const phone=await page.evaluate(()=>navigator.maxTouchPoints>0),h=page.viewportSize().height;
 const file=path.join(out,label+'-version.png');
 await page.screenshot({path:file,clip:phone?{x:23,y:h-106,width:168,height:78}:{x:24,y:h-93,width:150,height:70}});
 return execFileSync('tesseract',[file,'stdout','--psm','7','-c','tessedit_char_whitelist=vV0123456789.'],{encoding:'utf8',env:{...process.env,OMP_THREAD_LIMIT:'1'},stdio:['ignore','pipe','pipe']}).trim().toLowerCase();
}
async function ready(page){await page.waitForFunction(()=>!document.getElementById('status'),{},{timeout:120000});await page.waitForTimeout(900);}
function watch(page){page.on('pageerror',e=>result.errors.push(e.message));page.on('console',m=>{if(m.type()==='error')result.errors.push(m.text());});page.on('response',r=>{if(r.status()>=400)result.http_errors.push([r.status(),r.url()]);});}
async function clickWord(page,word){
 if(word==='begin'){
  if(await page.evaluate(()=>navigator.maxTouchPoints>0))await page.keyboard.press('Enter');
  else await page.mouse.click(940,345);
  return;
 }
 const file=path.join(out,'button-location.png');await page.screenshot({path:file});
 const tsv=execFileSync('tesseract',[file,'stdout','--psm','11','tsv'],{encoding:'utf8',env:{...process.env,OMP_THREAD_LIMIT:'1'},stdio:['ignore','pipe','pipe']});
 const row=tsv.split('\n').slice(1).map(s=>s.split('\t')).find(r=>(r[11]||'').toLowerCase().includes(word));
 assert(row,'Button word missing: '+word);const x=+row[6]+ +row[8]/2,y=+row[7]+ +row[9]/2;
 if(await page.evaluate(()=>navigator.maxTouchPoints>0))await page.touchscreen.tap(x,y);else await page.mouse.click(x,y);
}
(async()=>{
 const browser=await chromium.launch({executablePath:'/usr/bin/chromium',args:['--no-sandbox','--enable-webgl','--use-gl=angle','--use-angle=swiftshader','--enable-unsafe-swiftshader']});
 try{
  const pc=await browser.newContext({viewport:{width:1280,height:800}});const page=await pc.newPage();watch(page);
  await page.addInitScript(()=>{window.__audioContexts=[];const Audio=window.AudioContext;if(Audio)window.AudioContext=new Proxy(Audio,{construct(target,args){const ctx=Reflect.construct(target,args);window.__audioContexts.push(ctx);return ctx;}});});
  await page.goto('http://127.0.0.1:8085/?skip_story=1&lang=en');await ready(page);
  check(await page.title()==='Meowgnificent the wizard cat','web HTML and WASM start with the game title');
  let text=await screen(page,'pc-title',t=>t.includes('legacy studies')&&t.includes('settings'));
  check(text.includes('legacy studies'),'normal exported title renders its menu lettering');
  check((await readVersion(page,'pc')).replace(/^v/,'')==='0.41.1','the exported PC title visibly identifies v0.41.1');
  await clickWord(page,'begin');await page.waitForTimeout(500);
  await page.keyboard.press('i');text=await screen(page,'pc-bag',t=>t.includes('traveling possessions')||t.includes('satchel'));
  check(text.includes('practice wand')||text.includes('primary tool'),'exported equipment screen loads game art and starter gear');
  await page.keyboard.press('Escape');await page.waitForTimeout(180);await page.keyboard.press('Escape');
  await screen(page,'pc-pause',t=>t.includes('catnap'));check(true,'Escape opens the real sleeping-cat pause menu');
  await clickWord(page,'pairing');text=await screen(page,'pc-pairings',t=>t.includes('equipment pairings'));
  check(text.includes('element tricks')&&text.includes('happy accidents')&&text.includes('tumbling'),'pause guide renders all three pairing rows in the exported game');
  await page.keyboard.press('Escape');await screen(page,'pc-guide-back',t=>t.includes('catnap'));
  check(true,'Escape closes the guide back to pause without resuming combat');
  result.audio=await page.evaluate(()=>window.__audioContexts.map(c=>({state:c.state,sampleRate:c.sampleRate})));
  check(result.audio.some(c=>c.state==='running'),'real input unlocks the browser audio context');
  await page.reload();await ready(page);await screen(page,'pc-reload',t=>t.includes('legacy studies')&&t.includes('settings'));
  check(true,'exported game reloads with persisted browser storage without an exception');
  await pc.close();
  const phone=await browser.newContext({viewport:{width:1266,height:585},hasTouch:true,isMobile:true,deviceScaleFactor:1});
  const touch=await phone.newPage();watch(touch);await touch.goto('http://127.0.0.1:8085/?skip_story=1&lang=en');await ready(touch);
  await touch.touchscreen.tap(25,560);await touch.waitForTimeout(700);
  text=await screen(touch,'phone-title',t=>t.includes('legacy studies')&&t.includes('settings'));check((await readVersion(touch,'phone')).replace(/^v/,'')==='0.41.1','the phone title visibly identifies v0.41.1');await clickWord(touch,'begin');await touch.waitForTimeout(500);
  await touch.touchscreen.tap(1210,150);text=await screen(touch,'phone-bag',t=>t.includes('gear and satchel'));
  check(text.includes('basic magic: fireball')&&text.includes('already wearing'),'real touch opens the responsive phone bag with the worn starter fire wand');
  await touch.touchscreen.tap(1138,45);await touch.waitForTimeout(250);await touch.touchscreen.tap(1210,50);
  await screen(touch,'phone-pause',t=>t.includes('catnap'));await clickWord(touch,'pairing');
  text=await screen(touch,'phone-pairings',t=>t.includes('equipment pairings'));
  check(text.includes('element tricks')&&text.includes('happy accidents')&&text.includes('tumbling'),'phone touch opens the readable guide with all three pairings');
  await touch.touchscreen.tap(632,525);
  await screen(touch,'phone-guide-back',t=>t.includes('catnap'));
  check(true,'the phone guide return button responds to real touch and returns to pause');
  await phone.close();
  check(result.errors.length===0,'browser reports no JavaScript or engine console errors');
  check(result.http_errors.length===0,'exported game requests return no HTTP error');
  result.passed=true;
 }finally{
  await browser.close();fs.writeFileSync(path.join(out,'result.json'),JSON.stringify(result,null,2)+'\n');
 }
})().catch(e=>{console.error(e);process.exit(1);});

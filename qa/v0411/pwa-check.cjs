const {chromium}=require('playwright');
const fs=require('node:fs');
const path=require('node:path');
const assert=require('node:assert/strict');
const {execFileSync}=require('node:child_process');
const base=__dirname, site=path.join(base,'update-site'), out=path.join(base,'pwa-qa');
const old=path.join(base,'web-old'), next=path.resolve(base,'../../exports/web');
fs.mkdirSync(site,{recursive:true});fs.mkdirSync(out,{recursive:true});
for(const f of fs.readdirSync(old))fs.copyFileSync(path.join(old,f),path.join(site,f));
const result={checks:[],errors:[],actual_iphone:false};
const check=(ok,label)=>{assert(ok,label);result.checks.push(label);console.log('PASS: '+label);};
async function title(page,name,version){
 await page.waitForFunction(()=>!document.getElementById('status'),{},{timeout:120000});
 for(let i=0;i<10;i++){
  await page.waitForTimeout(400);
  const file=path.join(out,name+'.png');await page.screenshot({path:file});
  const text=execFileSync('tesseract',[file,'stdout','--psm','11'],{encoding:'utf8',env:{...process.env,OMP_THREAD_LIMIT:'1'},stdio:['ignore','pipe','pipe']}).toLowerCase();
  if(version){
   const badge=path.join(out,name+'-version.png');await page.screenshot({path:badge,clip:{x:24,y:707,width:150,height:70}});
   const value=execFileSync('tesseract',[badge,'stdout','--psm','7','-c','tessedit_char_whitelist=vV0123456789.'],{encoding:'utf8',env:{...process.env,OMP_THREAD_LIMIT:'1'},stdio:['ignore','pipe','pipe']}).trim().toLowerCase();
   if(value.replace(/^v/,'')===version.replace(/^v/,''))return text;
  }else if(text.includes('legacy studies'))return text;
 }
 assert.fail('Title missing: '+name+' '+version);
}
(async()=>{
 const browser=await chromium.launch({executablePath:'/usr/bin/chromium',args:['--no-sandbox','--enable-webgl','--use-gl=angle','--use-angle=swiftshader','--enable-unsafe-swiftshader']});
 try{
  const context=await browser.newContext({viewport:{width:1280,height:800}});
  let page=await context.newPage();page.on('pageerror',e=>result.errors.push(e.message));
  await page.goto('http://127.0.0.1:8086/?skip_story=1&lang=en');await title(page,'old-title');
  await page.evaluate(async()=>{await navigator.serviceWorker.ready;localStorage.setItem('meow-update-check','keep-this-browser-data');});
  await page.reload();await title(page,'old-controlled-title');
  check(await page.evaluate(()=>!!navigator.serviceWorker.controller),'the previous v0.41.0 export runs under its installed service worker');
  result.old_cache=await page.evaluate(()=>caches.keys());
  check(result.old_cache.length>0,'the previous version has an offline cache');
  for(const f of fs.readdirSync(next))fs.copyFileSync(path.join(next,f),path.join(site,f));
  await page.evaluate(async()=>{const r=await navigator.serviceWorker.getRegistration();await r.update();});
  await page.waitForFunction(async()=>{const r=await navigator.serviceWorker.getRegistration();return !!r.waiting;},{},{timeout:60000});
  check(true,'publishing the new export installs a waiting update while the old game remains open');
  await page.close();
  await new Promise(r=>setTimeout(r,1500));
  page=await context.newPage();page.on('pageerror',e=>result.errors.push(e.message));
  await page.goto('http://127.0.0.1:8086/?skip_story=1&lang=en');await title(page,'updated-title','v0.41.1');
  check(await page.evaluate(()=>localStorage.getItem('meow-update-check')==='keep-this-browser-data'),'closing and reopening updates to v0.41.1 without deleting browser storage');
  result.new_cache=await page.evaluate(()=>caches.keys());
  check(result.new_cache.length===1&&result.new_cache[0]!==result.old_cache[0],'the activated service worker replaces the old version cache');
  const manifest=JSON.parse(fs.readFileSync(path.join(next,'index.manifest.json'),'utf8'));
  result.offline_start_url=new URL(manifest.start_url,page.url()).href;
  await page.evaluate(url=>history.replaceState(null,'',url),result.offline_start_url);
  await context.setOffline(true);await page.reload();await title(page,'updated-offline-title','v0.41.1');
  check(true,'the updated v0.41.1 export starts offline from the same installed cache');
  check(result.errors.length===0,'the update and offline reload report no JavaScript exceptions');
  result.passed=true;await context.close();
 }finally{await browser.close();fs.writeFileSync(path.join(out,'result.json'),JSON.stringify(result,null,2)+'\n');}
})().catch(e=>{console.error(e);process.exit(1);});

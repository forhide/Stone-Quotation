import ctypes, json, os, pathlib, re, subprocess, time
from PIL import ImageGrab

base=pathlib.Path(__file__).resolve().parent
out=base/'native-qa';out.mkdir(exist_ok=True)
release=base/'unpacked-linux'
x=ctypes.CDLL('libX11.so.6');xt=ctypes.CDLL('libXtst.so.6')
x.XOpenDisplay.argtypes=[ctypes.c_char_p];x.XOpenDisplay.restype=ctypes.c_void_p
x.XStringToKeysym.argtypes=[ctypes.c_char_p];x.XStringToKeysym.restype=ctypes.c_ulong
x.XKeysymToKeycode.argtypes=[ctypes.c_void_p,ctypes.c_ulong];x.XKeysymToKeycode.restype=ctypes.c_uint
x.XSetInputFocus.argtypes=[ctypes.c_void_p,ctypes.c_ulong,ctypes.c_int,ctypes.c_ulong]
x.XFlush.argtypes=[ctypes.c_void_p]
xt.XTestFakeKeyEvent.argtypes=[ctypes.c_void_p,ctypes.c_uint,ctypes.c_int,ctypes.c_ulong]
xt.XTestFakeMotionEvent.argtypes=[ctypes.c_void_p,ctypes.c_int,ctypes.c_int,ctypes.c_int,ctypes.c_ulong]
xt.XTestFakeButtonEvent.argtypes=[ctypes.c_void_p,ctypes.c_uint,ctypes.c_int,ctypes.c_ulong]
d=x.XOpenDisplay(b':88');assert d
result={'platform':'linux','native_windows_tested':False,'mac_runtime_tested':False,'checks':[]}
env=os.environ.copy()
for name,folder in [('XDG_CACHE_HOME','cache'),('XDG_CONFIG_HOME','config'),('XDG_DATA_HOME','data')]:
    target=out/folder;target.mkdir(exist_ok=True);env[name]=str(target)
env.update(DISPLAY=':88',MEOW_SKIP_STORY='1',MEOW_LANGUAGE='en',MEOW_DISPLAY_APPLY='0',MEOW_PROFILE_PATH=str(out/'profile.json'),MEOW_SETTINGS_PATH=str(out/'settings.cfg'))
stream=(out/'process.log').open('w')
proc=subprocess.Popen([str(release/'Meowgnificent.x86_64'),'--audio-driver','Dummy','--resolution','1280x800','--position','0,0'],cwd=release,env=env,stdout=stream,stderr=subprocess.STDOUT)
window=None
def check(ok,label):
    assert ok,label
    result['checks'].append(label);print('PASS:',label,flush=True)
def key(name):
    code=x.XKeysymToKeycode(d,x.XStringToKeysym(name.encode()))
    xt.XTestFakeKeyEvent(d,code,1,0);x.XFlush(d);time.sleep(.12)
    xt.XTestFakeKeyEvent(d,code,0,0);x.XFlush(d);time.sleep(.25)
def shot(label):
    target=out/(label+'.png');ImageGrab.grab(xdisplay=':88').crop((0,0,1280,800)).save(target)
    return subprocess.run(['tesseract',str(target),'stdout','--psm','11'],capture_output=True,text=True,check=True,env={**env,'OMP_THREAD_LIMIT':'1'}).stdout.lower()
def screen(label,test):
    deadline=time.monotonic()+45;text=''
    while time.monotonic()<deadline:
        assert proc.poll() is None,'Exported process exited: '+str(proc.returncode)
        text=shot(label)
        if test(text): return text
        time.sleep(.2)
    raise AssertionError(label+': '+text)
def click_word(word):
    target=out/'button-location.png';ImageGrab.grab(xdisplay=':88').crop((0,0,1280,800)).save(target)
    rows=subprocess.run(['tesseract',str(target),'stdout','--psm','11','tsv'],capture_output=True,text=True,check=True,env={**env,'OMP_THREAD_LIMIT':'1'}).stdout.splitlines()[1:]
    row=next((r.split('\t') for r in rows if word in r.split('\t')[-1].lower()),None)
    assert row,'Button missing: '+word
    cx=int(row[6])+int(row[8])//2;cy=int(row[7])+int(row[9])//2
    xt.XTestFakeMotionEvent(d,0,cx,cy,0);x.XFlush(d);time.sleep(.1)
    xt.XTestFakeButtonEvent(d,1,1,0);x.XFlush(d);time.sleep(.1)
    xt.XTestFakeButtonEvent(d,1,0,0);x.XFlush(d);time.sleep(.3)
try:
    deadline=time.monotonic()+45
    while time.monotonic()<deadline and window is None:
        tree=subprocess.run(['xwininfo','-display',':88','-root','-tree'],capture_output=True,text=True,check=True).stdout
        for wid in re.findall(r'(0x[0-9a-f]+) "Meowgnificent the wizard cat',tree):
            props=subprocess.run(['xprop','-display',':88','-id',wid,'_NET_WM_PID'],capture_output=True,text=True).stdout
            if re.search(r'=\s*'+str(proc.pid)+r'\b',props):window=int(wid,16);break
        time.sleep(.2)
    assert window,'Native exported window not found'
    x.XSetInputFocus(d,window,1,0);x.XFlush(d)
    screen('title',lambda t:'legacy studies' in t and 'settings' in t)
    check(True,'extracted Linux executable renders its title through its own PCK')
    key('Return');time.sleep(.4);key('i')
    text=screen('bag',lambda t:'traveling possessions' in t or 'satchel' in t)
    check('practice wand' in text,'ordinary input opens the exported equipment menu with starter art')
    key('Escape');key('Escape')
    screen('pause',lambda t:'catnap' in t);check(True,'Escape pauses the exported game with the sleeping-cat card')
    click_word('pairing');text=screen('guide',lambda t:'equipment pairings' in t)
    check('pocket steam' in text and 'only currently worn' in text,'native pairing guide renders the current-slot rule and new element recipe')
    key('Escape');screen('guide-back',lambda t:'catnap' in t)
    check(True,'Escape closes only the pairing guide before resuming')
    click_word('main');screen('main-menu',lambda t:'legacy studies' in t and 'settings' in t);click_word('quit')
    proc.wait(timeout=30);stream.close()
    log=(out/'process.log').read_text()
    check(proc.returncode==0 and not re.search('SCRIPT ERROR:|ERROR:',log),'normal Quit exits the exported game cleanly without script or engine errors')
    result['passed']=True
finally:
    if proc.poll() is None:proc.terminate();proc.wait(timeout=10)
    stream.close();(out/'result.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')

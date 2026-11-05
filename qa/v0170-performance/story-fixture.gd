extends SceneTree
var room
func _initialize() -> void:call_deferred("run")
func pick(d: Node,index: int) -> void:
 d.page_index=index
 d._show_page()
func run() -> void:
 assert(DisplayServer.get_name()!="headless")
 change_scene_to_file("res://scenes/main.tscn")
 for i in range(8):await process_frame
 room=current_scene
 room.set_running(false)
 room.state="story"
 var d=room.story_director
 var output := []
 for scenario in ["exam","books","garden"]:
  if scenario=="exam":d.play_opening(Callable());pick(d,5)
  else:d.show_chapter(1 if scenario=="books" else 2,Callable());pick(d,3 if scenario=="books" else 0)
  d.auto_advance=false
  var start := Time.get_ticks_usec()
  var last := start
  var samples: Array[float]=[]
  var all_frames: Array[float]=[]
  var calls: Array[float]=[]
  var switched := 0
  while Time.get_ticks_usec()-start<8000000:
   await process_frame
   var now := Time.get_ticks_usec()
   var elapsed := float(now-start)/1000000.0
   var delta := float(now-last)/1000.0
   last=now
   all_frames.append(delta)
   if elapsed>2:
    samples.append(delta)
    calls.append(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
   if elapsed>2.2 and switched==0:
    pick(d,6 if scenario=="exam" else 4 if scenario=="books" else 1)
    switched=1
   if elapsed>4.4 and switched==1:
    pick(d,8 if scenario=="exam" else 5 if scenario=="books" else 2)
    switched=2
  samples.sort()
  var mean := 0.0
  var mean_calls := 0.0
  for f in samples:mean+=f
  for v in calls:mean_calls+=v
  output.append({"case":scenario,"frames":samples.size(),"frame_ms_mean":mean/samples.size(),"frame_ms_p50":samples[samples.size()/2],"frame_ms_p95":samples[mini(samples.size()-1,int(samples.size()*0.95))],"frame_ms_max":all_frames.max(),"draw_calls_mean":mean_calls/calls.size(),"actual_page_changes":switched,"raw_frame_ms":all_frames})
  d.close()
 var dest := OS.get_environment("MEOW_STORY_PERF_OUTPUT")
 var data := {"version":ProjectSettings.get_setting("application/config/version"),"adapter":RenderingServer.get_video_adapter_name(),"display":DisplayServer.get_name(),"window_pixels":str(root.size),"frame_limit":Engine.max_fps,"cases":output,"method":"Sequential actual rendering, each shot8s including2s warmup, two actual dialogue changes per scene; single trial on software renderer, not native Windows FPS."}
 var file := FileAccess.open(dest,FileAccess.WRITE)
 file.store_string(JSON.stringify(data,"  "))
 print("STORY_RENDER_PERF_DONE ",dest)
 room.queue_free()
 await process_frame
 quit()

extends SceneTree
var room
var frame := 0
var last := 0
var samples: Array[float]=[]
var draws: Array[float]=[]
func _initialize() -> void: call_deferred("start")
func start() -> void:
 Engine.max_fps=0
 change_scene_to_file("res://scenes/main.tscn")
 for i in range(5): await process_frame
 room=current_scene
 room.begin_or_restart()
 if OS.get_environment("MEOW_MENU_PERF")=="shop":
  room.load_sector(3)
  room.player.position=Vector2(640,585)
 else:
  for id in room.run.catalog:
   if not room.run.inventory.has(id): room.run.add_item(id)
  room.open_inventory()
 for i in range(5): await process_frame
 room.hud.arrival_pending=false
 room.hud.sector_banner.elapsed=100
 last=Time.get_ticks_usec()
 process_frame.connect(sample)
func sample() -> void:
 var now := Time.get_ticks_usec()
 var dt := (now-last)/1000.0
 last=now
 frame+=1
 if room.state=="inventory" and frame%10==0:
  room.panel._preview_item(str(room.run.inventory[(frame/10)%room.run.inventory.size()]))
 if frame>30:
  samples.append(dt)
  draws.append(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
 if frame>=210:
  samples.sort()
  var sum := 0.0
  for value in samples: sum+=value
  var draw_sum := 0.0
  for value in draws: draw_sum+=value
  var data := {"frames":samples.size(),"frame_ms_mean":sum/samples.size(),"frame_ms_p50":samples[samples.size()/2],"frame_ms_p95":samples[int(samples.size()*0.95)],"draw_calls_mean":draw_sum/draws.size(),"draw_calls_max":draws.max()}
  var f := FileAccess.open(OS.get_environment("MEOW_PERF_OUTPUT"),FileAccess.WRITE)
  f.store_string(JSON.stringify(data,"  "))
  print("PERF_RESULT "+JSON.stringify(data))
  quit()

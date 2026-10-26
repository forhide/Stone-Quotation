# Conservative render stress: 8 foes + 12 static drops + fire/effects.
extends SceneTree
var samples: Array[float]=[]
var draws: Array[float]=[]
var processes: Array[float]=[]
var physics: Array[float]=[]
var frame := 0
var last := 0
var room
func _initialize() -> void:
	Engine.max_fps=0
	call_deferred("start")
func start() -> void:
	change_scene_to_file("res://scenes/main.tscn")
	for i in range(5): await process_frame
	room=current_scene
	room.begin_or_restart()
	room.load_sector(7)
	for enemy in room.enemies: enemy.active=false
	room.player.position=Vector2(640,450)
	room.player.invulnerability=1000
	room.spells.resolver.rng.seed=42
	for point in [Vector2(720,470),Vector2(350,420),Vector2(950,500)]: room.ignite_floor(point)
	room.props[0].ignite(Vector2.RIGHT)
	room.effects.append({"point":Vector2(650,380),"age":0.15,"radius":60.0,"color":Color("ffcc88")})
	room.effects.append({"point":Vector2(900,420),"age":0.15,"radius":45.0,"color":Color("aaccbb")})
	for point in [Vector2(800,400),Vector2(1000,500)]:
		var shot=SpellProjectile.new()
		shot.position=point
		shot.process_mode=Node.PROCESS_MODE_DISABLED
		shot.outcome="overreaction"
		shot.radius=23
		room.projectiles.add_child(shot)
	for i in range(12):
		var point := Vector2(280+(i%4)*220,240+(i/4)*150)
		room.spawn_pickup("gold" if i<8 else "gear",point,8,"cinderfork_wand" if i>=8 else "")
	# Profile sustained combat after the brief arrival card has completed.
	for i in range(3): await process_frame
	room.hud.sector_banner.elapsed=100
	last=Time.get_ticks_usec()
	process_frame.connect(sample)
func sample() -> void:
	var now := Time.get_ticks_usec()
	var dt := (now-last)/1000.0
	last=now
	frame+=1
	room.player.position=Vector2(640,450)
	room.player.velocity=Vector2(150,0)
	room.player.wobble=frame*0.17
	room.player.cast_pose=0.6
	room.player.cast_outcome="overreaction"
	room.time=frame/60.0
	for fire in room.fires:
		fire.age=1.0
		fire.tick=10000.0
	room.props[0].timer=10000.0
	for effect in room.effects: effect.age=0.15
	for enemy in room.enemies:
		enemy.time=frame/60.0
		enemy.queue_redraw()
	for shot in room.projectiles.get_children():
		shot.age=frame/60.0
		shot.queue_redraw()
	if frame>30:
		samples.append(dt)
		draws.append(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
		processes.append(Performance.get_monitor(Performance.TIME_PROCESS)*1000)
		physics.append(Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS)*1000)
	if frame>=210:
		samples.sort()
		var output := {"frames":samples.size(),"frame_ms_mean":average(samples),"frame_ms_p50":samples[samples.size()/2],"frame_ms_p95":samples[int(samples.size()*0.95)],"frame_ms_p99":samples[int(samples.size()*0.99)],"process_ms_mean":average(processes),"physics_ms_mean":average(physics),"draw_calls_mean":average(draws),"draw_calls_max":draws.max(),"frames_over_33ms":samples.filter(func(x): return x>33.33).size()}
		print("PERF_RESULT "+JSON.stringify(output))
		var dest := OS.get_environment("MEOW_PERF_OUTPUT")
		if not dest.is_empty():
			var f := FileAccess.open(dest,FileAccess.WRITE)
			f.store_string(JSON.stringify(output,"  "))
		quit()
func average(values: Array[float]) -> float:
	var total := 0.0
	for value in values: total+=value
	return total/values.size()

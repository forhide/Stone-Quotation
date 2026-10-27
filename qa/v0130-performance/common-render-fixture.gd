extends SceneTree

# Shared, rendered fixture for the released v0.12 and integrated v0.13 source.
# Presentation is controlled; this is not a native-Windows or AI benchmark.
const WARMUP_SECONDS := 2.0
const SAMPLE_SECONDS := 8.0
const SKILL_ITEMS := ["practice_wand", "crooked_ash_wand", "cinderfork_wand"]
var room
var scenario := "combat"
var elapsed := 0.0
var last_us := 0
var frames := 0
var samples: Array[float] = []
var process_ms: Array[float] = []
var physics_ms: Array[float] = []
var draws: Array[float] = []
var primitives: Array[float] = []
var objects: Array[float] = []
var warmup: Array[float] = []
var shots: Array[SpellProjectile] = []
var skill_turn := -1
var roll_turn := -1
var movement_turn := -1
var dialogue_turn := -1
var interaction_turn := -1
var skill_casts := 0
var rolls := 0
var dialogue_changes := 0
var interactions := 0
var sample_start_drawn := 0

func _initialize() -> void:
	call_deferred("start")

func start() -> void:
	if DisplayServer.get_name() == "headless":
		push_error("This fixture requires an actual graphical renderer.")
		quit(2)
		return
	scenario = OS.get_environment("MEOW_PERF_CASE")
	if scenario.is_empty(): scenario = "combat"
	if scenario not in ["combat", "shop", "story"]:
		push_error("Unknown rendered performance case: " + scenario)
		quit(2)
		return
	seed(42)
	change_scene_to_file("res://scenes/main.tscn")
	for i in range(6): await process_frame
	room = current_scene
	room.begin_or_restart()
	room.spells.resolver.rng.seed = 42
	room.skills.resolver.rng.seed = 42
	match scenario:
		"combat": prepare_combat()
		"shop":
			room.load_sector(3)
			room.player.position = Vector2(640, 495)
			room.player.reset_physics_interpolation()
		"story":
			room.set_running(false)
			room.state = "story"
			room.hud.overlay.hide()
			room.story_director.show_chapter(7, Callable())
			room.story_director.auto_advance = false
	for i in range(6): await process_frame
	room.hud.arrival_pending = false
	room.hud.sector_banner.elapsed = 100.0
	last_us = Time.get_ticks_usec()
	process_frame.connect(sample)

func prepare_combat() -> void:
	room.load_sector(7)
	for foe in room.enemies:
		foe.active = false
		foe.set_physics_process(false)
		foe.health.maximum = 1000000
		foe.health.current = 1000000
	room.player.position = Vector2(500, 570)
	room.player.reset_physics_interpolation()
	room.player.invulnerability = 10000.0
	for id in ["apprentice_thesis", "nine_lives_collar", "moonlit_yarn"]:
		if not room.run.inventory.has(id): room.run.add_item(id)
		room.equip_gear(id)
	# The same fixed floor, shelf, impact and elemental load in both releases.
	for point in [Vector2(720, 470), Vector2(350, 420), Vector2(950, 500)]:
		room.ignite_floor(point)
	if not room.props.is_empty(): room.props[0].ignite(Vector2.RIGHT)
	room.effects.append({"point":Vector2(650, 380),"age":0.15,"radius":60.0,"color":Color("ffcc88")})
	room.effects.append({"point":Vector2(900, 420),"age":0.15,"radius":45.0,"color":Color("aaccbb")})
	var elements := ["fire", "water", "ice", "wind", "stone", "leaf", "lightning"]
	for i in range(elements.size()):
		var shot := SpellProjectile.new()
		shot.position = Vector2(360 + i * 92, 385)
		shot.element = elements[i]
		shot.radius = 14.0
		shot.outcome = "overreaction" if i == 0 else "success"
		shot.process_mode = Node.PROCESS_MODE_DISABLED
		room.projectiles.add_child(shot)
		shots.append(shot)
	for i in range(12):
		room.spawn_pickup("gold" if i < 8 else "gear", Vector2(280 + (i % 4) * 220, 195 + (i / 4) * 35), 8, "cinderfork_wand" if i >= 8 else "")
	for id in SKILL_ITEMS:
		if not room.run.inventory.has(id): room.run.add_item(id)

func animate_combat() -> void:
	room.player.health.current = room.player.health.maximum
	room.player.invulnerability = 10000.0
	room.player.aim = Vector2.RIGHT
	var next_movement := int(elapsed / 1.2)
	if next_movement != movement_turn:
		movement_turn = next_movement
		Input.action_release("move_left")
		Input.action_release("move_right")
		Input.action_press("move_right" if movement_turn % 2 == 0 else "move_left")
	for fire in room.fires:
		fire.age = 1.0
		fire.tick = 10000.0
	if not room.props.is_empty(): room.props[0].timer = 10000.0
	for effect in room.effects: effect.age = 0.15
	# Never accumulate callback-generated impacts or floors without a bound.
	while room.effects.size() > 4: room.effects.remove_at(2)
	while room.fires.size() > 4: room.fires.remove_at(3)
	var progress := fmod(elapsed, 0.85) / 0.85
	for i in range(room.enemies.size()):
		var foe = room.enemies[i]
		foe.time = elapsed
		foe.phase = "windup"
		foe.phase_time = (0.85 if foe.role == "examiner" else 0.5 if foe.role == "bat" else 0.72) * (1.0 - progress)
		foe.attack_direction = Vector2.RIGHT.rotated(-0.65 + i * 0.18)
		foe.queue_redraw()
	for shot in shots:
		shot.age = elapsed
		shot.queue_redraw()
	var next_skill := int(elapsed / 1.8)
	if next_skill != skill_turn:
		skill_turn = next_skill
		room.player.roll_time = 0.0
		room.skills.cooldown_remaining = 0.0
		room.spells.pending = false
		room.equip_gear(SKILL_ITEMS[skill_turn % SKILL_ITEMS.size()])
		room.skills.resolver.forced = ["success", "miscast", "overreaction"][skill_turn % 3]
		if room.skills.cast(Vector2.RIGHT): skill_casts += 1
	var next_roll := int((elapsed + 0.9) / 1.8)
	if next_roll != roll_turn:
		roll_turn = next_roll
		if elapsed > 0.7:
			room.player.roll_cooldown = 0.0
			if room.player.start_roll(Vector2.RIGHT if movement_turn % 2 == 0 else Vector2.LEFT): rolls += 1

func sample() -> void:
	var now := Time.get_ticks_usec()
	var delta := float(now - last_us) / 1000000.0
	last_us = now
	elapsed += delta
	frames += 1
	match scenario:
		"combat": animate_combat()
		"shop":
			var turn := int(elapsed / 2.0)
			if turn != interaction_turn:
				interaction_turn = turn
				room.markers.gathering.player_position = Vector2(640, 495)
				if room.markers.gathering.interact("pip"): interactions += 1
		"story":
			var turn := int(elapsed / 1.25)
			if turn != dialogue_turn:
				dialogue_turn = turn
				room.story_director.page_index = turn % 2
				room.story_director._show_page()
				dialogue_changes += 1
	if elapsed <= WARMUP_SECONDS:
		warmup.append(delta * 1000.0)
		sample_start_drawn = Engine.get_frames_drawn()
	else:
		samples.append(delta * 1000.0)
		process_ms.append(Performance.get_monitor(Performance.TIME_PROCESS) * 1000.0)
		physics_ms.append(Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS) * 1000.0)
		draws.append(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))
		primitives.append(Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME))
		objects.append(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))
	if elapsed >= WARMUP_SECONDS + SAMPLE_SECONDS: finish()

func finish() -> void:
	Input.action_release("move_left")
	Input.action_release("move_right")
	if samples.size() < 10 or draws.max() <= 0:
		push_error("Too few rendered samples; no performance result can be recorded.")
		quit(2)
		return
	var sorted := samples.duplicate()
	sorted.sort()
	var output := {
		"fixture":"v013_shared_render_v1", "case":scenario,
		"project_version":ProjectSettings.get_setting("application/config/version"),
		"display_server":DisplayServer.get_name(), "adapter":RenderingServer.get_video_adapter_name(),
		"renderer":RenderingServer.get_current_rendering_method(),
		"window_pixels":str(root.size), "logical_canvas":str(root.get_visible_rect().size),
		"stretch_mode":ProjectSettings.get_setting("display/window/stretch/mode"),
		"engine_max_fps":Engine.max_fps, "vsync_mode":DisplayServer.window_get_vsync_mode(),
		"warmup_seconds":WARMUP_SECONDS, "sample_seconds":SAMPLE_SECONDS,
		"frames":samples.size(), "rendered_frames":Engine.get_frames_drawn()-sample_start_drawn,
		"frame_ms_mean":mean(samples), "frame_ms_p50":percentile(sorted, 0.5),
		"frame_ms_p95":percentile(sorted, 0.95), "frame_ms_p99":percentile(sorted, 0.99),
		"frames_over_16_67ms":samples.filter(func(value: float) -> bool: return value > 16.67).size(),
		"frames_over_33_33ms":samples.filter(func(value: float) -> bool: return value > 33.33).size(),
		"process_ms_mean":mean(process_ms), "physics_ms_mean":mean(physics_ms),
		"draw_calls_mean":mean(draws), "draw_calls_max":draws.max(),
		"primitives_mean":mean(primitives), "rendered_objects_mean":mean(objects),
		"enemy_count":room.enemies.size(), "loot_count":room.loot.size(),
		"skill_casts":skill_casts, "rolls":rolls, "dialogue_changes":dialogue_changes,
		"shop_interactions":interactions, "frame_ms":samples,
		"note":"Uncapped software-rendered presentation workload; not native Windows hardware FPS."
	}
	var destination := OS.get_environment("MEOW_PERF_OUTPUT")
	if destination.is_empty():
		push_error("MEOW_PERF_OUTPUT is required.")
		quit(2)
		return
	var file := FileAccess.open(destination, FileAccess.WRITE)
	if file == null:
		push_error("Could not write rendered performance result.")
		quit(2)
		return
	file.store_string(JSON.stringify(output, "  "))
	output.erase("frame_ms")
	print("PERF_RESULT " + JSON.stringify(output))
	quit()

func mean(values: Array[float]) -> float:
	var total := 0.0
	for value in values: total += value
	return total / maxf(1.0, values.size())

func percentile(sorted: Array[float], fraction: float) -> float:
	return sorted[mini(sorted.size()-1, maxi(0, int(ceil(sorted.size()*fraction))-1))]

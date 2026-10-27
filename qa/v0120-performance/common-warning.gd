# Identical source fixture for the v0.7.0 and v0.8.0 renderers.
# Forces only presentation state; this is not a gameplay/AI FPS benchmark.
extends "res://tests/performance_expedition.gd"
func start() -> void:
 await super.start()
 for id in ["apprentice_thesis","nine_lives_collar","moonlit_yarn"]:
  room.run.add_item(id)
  room.equip_gear(id)
 Input.action_press("move_right")
func sample() -> void:
 super.sample()
 # Let real physics advance the new distance-driven feet. Both versions receive
 # the same movement input, position reset, empty cast pose and three accessories.
 room.player.cast_pose=0
 room.player.cast_prepare=0
 room.player.hit_reaction=0
 var progress := fmod(frame/60.0,0.85)/0.85
 for i in range(room.enemies.size()):
  var enemy=room.enemies[i]
  enemy.phase="windup"
  enemy.phase_time=(0.85 if enemy.role=="examiner" else 0.5 if enemy.role=="bat" else 0.72)*(1.0-progress)
  enemy.attack_direction=Vector2.RIGHT.rotated(-0.65+i*0.18)
  enemy.queue_redraw()

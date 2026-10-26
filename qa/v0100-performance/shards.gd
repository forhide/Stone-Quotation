extends "/tmp/meowgnificent-v080-perf-grounded.gd"
func sample() -> void:
 super.sample()
 for enemy in room.enemies:
  if enemy is PerfectExaminer:
   enemy.vulnerability_time=3.0
   enemy.barrier_break_age=0.13+fmod(frame/60.0,0.8)
   enemy.barrier_visual.sync()

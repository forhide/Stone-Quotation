extends "/tmp/meowgnificent-v080-perf-grounded.gd"
func start() -> void:
 await super.start()
 room.skills.resolver.forced="success"
 room.skills.cast(Vector2.RIGHT)
 for node in room.skills.spawned_effects:
  if is_instance_valid(node):
   if node.get("duration")!=null: node.duration=10000.0
   if node.get("damage")!=null: node.damage=0

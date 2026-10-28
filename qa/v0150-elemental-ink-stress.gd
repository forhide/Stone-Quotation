extends SceneTree
class InkProbe extends Node2D:
 var clock := 0.0
 func _draw() -> void:
  for i in range(7):
   var element: String=["fire","water","ice","wind","stone","leaf","lightning"][i]
   ElementalFlightInk.draw(self,element,Vector2(90+i*140,300),Vector2.from_angle(clock*2),clock,1.0,["success","miscast","overreaction"][i%3])
var probe
func _initialize() -> void:call_deferred("run")
func run() -> void:
 probe=InkProbe.new()
 root.add_child(probe)
 for i in range(150):
  probe.clock=float(i)*0.113
  probe.queue_redraw()
  await process_frame
 probe.free()
 print("INK STRESS: all7elements,3outcomes,150time/angle frames submitted")
 quit()

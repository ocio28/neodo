extends "res://src/core/Npc.gd"

var target = null

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func act(delta):
	if target != null:
		var dir = (target.position - position).normalized()
		
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_ray(position, target.position, [self], collision_mask)
		if result.empty():
			if dir.x > 0:
				right()
			elif dir.x < 0:
				left()
				
			if dir.y < 0:
				up()
			elif dir.y > 0:
				down()
		
		move(delta)


func _on_Vision_body_entered(body):
	target = body


func _on_Vision_body_exited(body):
	target = null


func _on_DamageArea_body_entered(body):
	do_damage(body, true)

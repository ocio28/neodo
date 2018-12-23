extends "res://src/core/Npc.gd"

var time = 0
var shift = false

func act(delta):
	time += delta
	if time > 2:
		time = 0
		shift = !shift
	
	if shift:
		right()
	else:
		left()
	
	if facing == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	move(delta)

func _on_DamageArea_body_entered(body):
	if body.is_in_group("walls"):
		return
	do_damage(body, true)

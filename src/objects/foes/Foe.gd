extends "res://src/core/Npc.gd"

export (int) var shiftTime = 1
export (Vector2) var control = Vector2(1, 0)
var time = 0
#var shift = false

func act(delta):
	time += delta
	if time > shiftTime:
		do_shift()
	
	if control.x < 0:
		right()
	elif control.x > 0:
		left()
	if control.y < 0:
		up()
	elif control.y > 0:
		down()
	
	if facing == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
		
	move(delta)
	
	var slides = get_slide_count()
	if slides > 0:
		do_shift()
	#for i in range(count):
	#	var collision = get_slide_collision(i)
		
func do_shift():
	time = 0
	control *= -1
	
func kill():
	if randf() > 0.5:
		Spawner.heart(global_position)
	queue_free()

func _on_DamageArea_body_entered(body):
	if body.is_in_group("walls"):
		return
	do_damage(body, true)

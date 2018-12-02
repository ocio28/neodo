extends "res://src/core/Npc.gd"

var time = 0

func _ready():
	direction = Vector2(-1, 0)

func _physics_process(delta):
	time += delta
	if time > 2:
		time = 0
		direction.x *= -1
	
	facing()
	if facing == 1:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	move(delta)

extends "res://src/core/Npc.gd"

export (float) var shiftTime = 0.8


var index = 0
var time = 0

func act(delta):
	time += delta
	if time > shiftTime:
		time = 0
		index += 1
		if index > 3:
			index = 0
	
	if index == 0:
		right()
	elif index == 1:
		down()
	elif index == 2:
		left()
	elif index == 3:
		up()
		
	move(delta)

func _on_Area2D_body_entered(body):
	do_damage(body, true)

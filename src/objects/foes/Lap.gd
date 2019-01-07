extends Node2D

export (Vector2) var speed = Vector2(40, 40)
export (float) var deltaLerp = 0.01
export (int) var yDirection = -1

var direction = 1
var t = 0

func _process(delta):
	t += deltaLerp
	if t > 1:
		t = 0
		direction *= -1
		
	var yspeed = lerp(-1, 1, t)
		
	var velocity = Vector2(speed.x * direction, speed.y * yspeed * yDirection)

	translate(velocity * delta)


func _on_Area2D_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(1)

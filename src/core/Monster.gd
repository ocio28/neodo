extends "res://src/core/Npc.gd"

export(bool) var agressive = false

var target = null
var attack = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	attack = false
	if target != null:
		var sub = target.position - position
		var distance = sub.length_squared()
		#print(distance)
		if distance < 90:
			attack = true
			
		direction = Vector2(0, 0)
		sub = sub.normalized()
		if sub.x < -0.5:
			direction.x = -1
		elif sub.x > 0.5:
			direction.x = 1
		if sub.y < -0.5:
			direction.y = -1
		elif sub.y > 0.5:
			direction.y = 1
			
		if distance > 80:
			move(delta)
			
	if attack:
		#print(facing)
		$BasicAttack.attack(facing)

func _on_Area2D_body_entered(body):
	if body.is_in_group("players"):
		target = body


func _on_Area2D_body_exited(body):
	if body == target:
		target = null

extends Area2D

export (float) var duration = 0.10
var time_attack = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if visible:
		time_attack += delta
		if time_attack > duration:
			stop()

func act():
	visible = true
	time_attack = 0
	
func stop():
	visible = false


func _on_BasicAttack_body_entered(body):
	print('attacking', body)

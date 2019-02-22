extends Node2D

var available = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_just_pressed("attack") and available:
		$Page.visible = !$Page.visible
		
	get_tree().paused = $Page.visible
	


func _on_Area2D_body_entered(body):
	available = true


func _on_Area2D_body_exited(body):
	available = false

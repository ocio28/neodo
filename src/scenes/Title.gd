extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_start") || Input.is_action_just_pressed("attack"):
		Core.new_game()

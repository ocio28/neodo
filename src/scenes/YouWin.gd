extends Node2D

func _ready():
	$Time.text = Utils.to_time(Core.gameTime)

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		Core.new_game()

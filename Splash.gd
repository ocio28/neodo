extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	OS.set_window_size(Vector2(768, 432))
	OS.set_window_position(Vector2(OS.window_position.x * 0.7, OS.window_position.y * 0.5))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Timeout_timeout():
	Core.new_game()

extends Camera2D

func _process(delta):
	State.camera_x = global_position.x
	global_position.y = 0

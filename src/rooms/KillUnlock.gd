extends Node2D

func _process(delta):
	if get_child_count() == 1:
		Spawner.key($ItemPosition.global_position)
		queue_free()

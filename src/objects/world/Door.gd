extends StaticBody2D

func _on_Area2D_body_entered(body):
	if Core.state.keys > 0:
		Core.use_key()
		queue_free()

extends Area2D

func _on_Key_body_entered(body):
	Core.take_key()
	queue_free()

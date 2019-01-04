extends Node2D

export (int) var amount = 1

func _on_Area2D_body_entered(body):
	Core.take_bit(amount)
	queue_free()

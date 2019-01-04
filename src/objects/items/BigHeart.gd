extends Node2D

export (String) var id = "BigHeart"

func _ready():
	if Core.exist_item(id):
		queue_free()

func _on_Area2D_body_entered(body):
	body.take_bigheart()
	Core.take_item(id)
	queue_free()

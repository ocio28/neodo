extends Area2D

export (NodePath) var targetPath = null

var target = null

func _ready():
	target = get_node(targetPath)

func _on_Key_body_entered(body):
	target.queue_free()
	queue_free()

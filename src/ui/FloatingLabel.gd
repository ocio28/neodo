extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	rect_position.y -= 30 * delta

func _on_SelfDestroy_timeout():
	queue_free()

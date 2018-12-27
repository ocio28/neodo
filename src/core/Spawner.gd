extends Node

const Heart = preload("res://src/objects/items/Heart.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func heart(position):
	_instance(Heart.instance(), position)	
	
func _instance(obj, position):
	obj.position = Vector2(position.x, position.y)
	get_tree().root.add_child(obj)
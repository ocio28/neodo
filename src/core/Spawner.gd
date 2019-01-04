extends Node

const Heart = preload("res://src/objects/items/Heart.tscn")
const Key = preload("res://src/objects/world/Key.tscn")
const Bit = preload("res://src/Bit.tscn")

func heart(position):
	_instance(Heart.instance(), position)	
	
func key(position):
	_instance(Key.instance(), position)
	
func bit(position):
	_instance(Bit.instance(), position)
	
func _instance(obj, position):
	obj.position = Vector2(position.x, position.y)
	get_node("/root/Game/Spawner").add_child(obj)

extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var room = load(Utils.current_room.name)
	var instance = room.instance()
	
	$Evelin.position = instance.get_node(Utils.current_room.position).position
	$CurrentRoom.add_child(instance)


func _process(delta):
	if $Evelin == null:
		Core.you_lose()

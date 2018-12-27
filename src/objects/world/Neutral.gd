extends Node2D

enum ItemType {VOID, HEART}

export (ItemType) var drop = ItemType.VOID

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func take_damage(dmg, dir):
	match drop:
		ItemType.HEART: Spawner.heart(global_position)
			
	queue_free()

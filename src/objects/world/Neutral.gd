extends Node2D

enum ItemType {BIT, HEART}

export (ItemType) var drop = ItemType.BIT


func take_damage(dmg, dir):
	if randf() * 10 > 0.7:
		spawn(drop)
	else:
		spawn(BIT)
			
	queue_free()

func spawn(item):
	match item:
			ItemType.HEART: Spawner.heart(global_position)
			ItemType.BIT: Spawner.bit(global_position)
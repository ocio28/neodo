extends Control

const HeartTexture = preload("res://assets/images/items/heart.png")
const HeartEmptyTexture = preload("res://assets/images/items/heart_empty.png")
const Heart = preload("res://src/ui/Heart.tscn")

func _ready():
	for i in Core.state.player.maxHp:
		var instance = Heart.instance()
		instance.rect_position = Vector2((i * 10) + 2, 2)
		instance.texture = HeartEmptyTexture
		$Hp.add_child(instance)

func _process(delta):
	for i in Core.state.player.maxHp:
		var heart = $Hp.get_child(i)
		if heart == null:
			heart = create_heart(i)
		if i < Core.state.player.hp:
			heart.texture = HeartTexture
		else:
			heart.texture = HeartEmptyTexture

func create_heart(i):
	var instance = Heart.instance()
	instance.rect_position = Vector2((i * 10) + 2, 2)
	instance.texture = HeartEmptyTexture
	$Hp.add_child(instance)
	return instance
extends Node2D

enum ItemType {VOID, CIRCLE, TRIANGLE, SQUARE}

export (ItemType) var type = ItemType.VOID

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	if type == ItemType.CIRCLE:
		Core.circle()
	if type == ItemType.TRIANGLE:
		Core.triangle()
	if type == ItemType.SQUARE:
		Core.square()
	queue_free()

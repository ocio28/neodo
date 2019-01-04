extends Node2D

export (String, "Outworld", "BonusRoom") var room = "BonusRoom"
export (String, "Initial", "BonusExit") var initialPosition = "Initial"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	print('opendoor', body)
	Utils.goto_bonusroom('/' + room, initialPosition)

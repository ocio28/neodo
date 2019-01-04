extends Node2D

export (String, "Outworld", "BonusRoom") var room = "BonusRoom"
export (String, "Initial", "BonusExit") var initialPosition = "Initial"

func _on_Area2D_body_entered(body):
	Utils.goto_room('/' + room, initialPosition)

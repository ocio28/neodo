extends Node2D

func _process(delta):
	$Circle.visible = Core.state.circle
	$Square.visible = Core.state.square
	$Triangle.visible = Core.state.triangle


func _on_Area2D_body_entered(body):
	Core.you_win()

extends Control

const CircleTexture = preload("res://assets/images/items/circle.png")
const CircleBorderTexture = preload("res://assets/images/items/circle_border.png")
const TriangleTexture = preload("res://assets/images/items/triangle.png")
const TriangleBorderTexture = preload("res://assets/images/items/triangle_border.png")
const SquareTexture = preload("res://assets/images/items/square.png")
const SquareBorderTexture = preload("res://assets/images/items/square_border.png")


func _ready():
	visible = false

func _process(delta):
	if Input.is_action_just_pressed("ui_start"):
		visible = !visible
		get_tree().paused = !get_tree().paused
		
	$Panel/KeyLabel.text = "x " + str(Core.state.keys)
	$Panel/BitLabel.text = "x " + str(Core.state.bits)
	
	if Core.state.circle:
		$Panel/CircleTexture.texture = CircleTexture
	else:
		$Panel/CircleTexture.texture = CircleBorderTexture
		
	if Core.state.triangle:
		$Panel/TriangleTexture.texture = TriangleTexture
	else:
		$Panel/TriangleTexture.texture = TriangleBorderTexture
		
	if Core.state.square:
		$Panel/SquareTexture.texture = SquareTexture
	else:
		$Panel/SquareTexture.texture = SquareBorderTexture

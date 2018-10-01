extends KinematicBody2D

export(int) var maxHp = 1
export(Vector2) var speed = Vector2(80, 80)

const FloatingLabel = preload("res://src/ui/FloatingLabel.tscn")

onready var hp = maxHp
var direction = Vector2(-1, 0)
var facing = 3

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func facing():
	if direction.y == -1:
		facing = 0
	elif direction.y == 1:
		facing = 2
	elif direction.x == 1:
		facing = 1
	elif direction.x == -1:
		facing = 3

func move(delta):
	move_and_collide(speed * direction * delta)

func take_damage(atk):
	hp -= atk
	show_label(atk)
	if hp <= 0:
		queue_free()
	
	
func show_label(value):
	var label = FloatingLabel.instance()
	label.text = str(value)
	label.rect_position = Vector2(global_position.x, global_position.y)
	get_tree().root.add_child(label)
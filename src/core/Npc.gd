extends KinematicBody2D

export(int) var maxHp = 1
export(Vector2) var speed = Vector2(40, 40)

const FloatingLabel = preload("res://src/ui/FloatingLabel.tscn")

onready var hp = maxHp
var direction = Vector2(1, 0)
var facing = 1

func _physics_process(delta):
	direction = Vector2()
	act(delta)
	
func act(delta):
	pass
	
func up():
	facing = 0
	direction.y = -1
	
func down():
	facing = 2
	direction.y = 1
	
func left():
	facing = 3
	direction.x = -1
	
func right():
	facing = 1
	direction.x = 1

func move(delta):
	move_and_slide(speed * direction)

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
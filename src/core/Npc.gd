extends KinematicBody2D

export(int) var maxHp = 1
export(Vector2) var speed = Vector2(40, 40)

const FloatingLabel = preload("res://src/ui/FloatingLabel.tscn")

onready var hp = maxHp
var direction = Vector2(1, 0)
var facing = 1
var takingDamage = false
var damageDirection = Vector2(0, 0)
var iframes = 0.25
var i_time = 0

func _physics_process(delta):
	direction = Vector2()
	if takingDamage:
		i_time += delta
		knockBack()
		if i_time > iframes:
			takingDamage = false
			$Sprite.visible = true
	else:
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
	
func knockBack():
	$Sprite.visible = !$Sprite.visible
	move_and_slide(speed * damageDirection * 1.3)
	
func facingVector():
	match facing:
		0: return Vector2(0, -1)
		1: return Vector2(1, 0)
		2: return Vector2(0, 1)
		3: return Vector2(-1, 0)
	return Vector2(0, 0)

func take_damage(dmg, dir):
	if takingDamage:
		return
		
	damageDirection = dir
	hp -= dmg
	show_label(dmg)
	on_hp_change()
	if hp <= 0:
		queue_free()
	else:
		i_time = 0
		takingDamage = true
	
func do_damage(obj, contact):
	var fv = facingVector()
	if contact:
		fv = obj.facingVector() * -1
	if obj.has_method("take_damage"):
		obj.take_damage(1, fv)
		
func take_heal(heal):
	hp += heal
	on_hp_change()
		
func on_hp_change():
	pass
	
func show_label(value):
	var label = FloatingLabel.instance()
	label.text = str(value)
	label.rect_position = Vector2(global_position.x, global_position.y)
	get_tree().root.add_child(label)
extends Node2D

const damage = 1
var attacking = false

var time = 0

func _ready():
	$Sprite.visible = false
	$Area2D/CollisionShape2D.disabled = true

func _process(delta):
	if attacking:
		time += delta
		if time > 0.3:
			attacking = false
			time = 0
			$Sprite.visible = false
			$Area2D/CollisionShape2D.disabled = true

func act(facing):
	if attacking:
		return
		
	attacking = true
	$Sprite.visible = true
	var degrees = 90 * facing
	$Sprite.rotation_degrees = degrees
	$Area2D.rotation_degrees = degrees
	$Area2D/CollisionShape2D.disabled = false


func _on_Area2D_area_entered(area):
	var obj = area.get_parent()
	if obj.has_method("take_damage"):
		print('take damage')
		obj.take_damage(damage)

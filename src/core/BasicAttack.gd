extends Node2D

export(int) var attack = 1
export(int) var cooldown = 1
export(float) var attackLength = 0.2

var cooldownTimer = 0
var attackTimer = 0

var inCooldown = false
var attacking = false
var target = null

#func _ready():
	#$Area2D/CollisionShape2D.disabled = true

func _process(delta):
	if inCooldown:
		cooldownTimer += delta
		if cooldownTimer > cooldown:
			inCooldown = false
			cooldownTimer = 0
			
	if attacking:
		attackTimer += delta
		if attackTimer > attackLength:
			#$Area2D/CollisionShape2D.disabled = true
			attacking = false
			inCooldown = true
			attackTimer = 0
		

func attack(facing):
	if not attacking && not inCooldown:
		attacking = true
		#$Area2D/CollisionShape2D.disabled = false
		rotation_degrees = facing * 90
		#rotation_degrees = degrees
		print('rotation', target)
		if target != null:
			target.take_damage(attack)
		
func _on_Area2D_body_entered(body):
	print('BODY ENTER', body)
	if body.has_method("take_damage"):
		target = body
		#body.take_damage(attack)

func _on_Area2D_body_exited(body):
	if body == target:
		target = null

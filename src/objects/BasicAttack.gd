extends Area2D

export (int) var damage = 1
export (float) var duration = 0.10
export (float) var cooldown = 0.2
var attack_time = 0
var cd_time = 0 
var isCd = false

func _process(delta):
	if visible:
		attack_time += delta
		if attack_time > duration:
			stop()

	
	if isCd:
		cd_time += delta
		if cd_time > cooldown:
			cd_time = 0
			isCd = false

func act(facing):
	if not isCd:
		visible = true
		attack_time = 0
		match facing:
			0: $Sprite.rotation_degrees = 90
			1: $Sprite.rotation_degrees = 180
			2: $Sprite.rotation_degrees = 270
			3: $Sprite.rotation_degrees = 0
	
func stop():
	visible = false
	isCd = true
	
func do_damage(obj):
	if visible && obj.has_method("take_damage"):
		obj.take_damage(damage)

func _on_BasicAttack_body_entered(body):
	do_damage(body.get_parent())


func _on_BasicAttack_area_entered(area):
	do_damage(area.get_parent())

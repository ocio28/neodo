extends "res://src/core/Human.gd"

#func _ready():
#	$Sword.visible = false

func _physics_process(delta):
#	if $Sword.attacking:
#		return
		
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var attack = Input.is_action_pressed("attack")
	
	direction = Vector2()
	if up:
		direction.y = -1
	elif down:
		direction.y = 1
		
	if right:
		direction.x = 1
	elif left:
		direction.x = -1
		
	if direction.x == 1:
		$Sprite.flip_h = true
	elif direction.x == -1:
		$Sprite.flip_h = false
	if attack:
		$BasicAttack.act()
	
	if up || down || right || left:
		move(delta)

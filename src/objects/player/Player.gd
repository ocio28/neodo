extends "res://src/core/Human.gd"

#func _ready():
#	$Sword.visible = false

func _physics_process(delta):
	if $BasicAttack.attacking:
		return
		
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var attack = Input.is_action_just_pressed("attack")
	
	direction = Vector2()
	if up:
		direction.y = -1
	elif down:
		direction.y = 1
		
	if right:
		direction.x = 1
	elif left:
		direction.x = -1
		
	facing()
	if direction.x == 1:
		$Sprite.flip_h = false
	elif direction.x == -1:
		$Sprite.flip_h = true
	
	if attack:
		match facing:
			0: $BasicAttack.position = $Top.position
			1: $BasicAttack.position = $Right.position
			2: $BasicAttack.position = $Down.position
			3: $BasicAttack.position = $Left.position
		$BasicAttack.act(facing)

	
	if up || down || right || left:
		move(delta)

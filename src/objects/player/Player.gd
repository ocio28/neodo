extends "res://src/core/Human.gd"
"""
const AttackingTexture = preload("res://assets/images/evelin/evelin_attacking.png")
const StandTexture = preload("res://assets/images/evelin/evelin.png")
const FrontTexture = preload("res://assets/images/evelin/front.png")
const BackTexture = preload("res://assets/images/evelin/back.png")
"""

func _physics_process(delta):
	if $BasicAttack.attacking:
		if facing == 1 || facing == 3:
			$Sprite.frame = 3
		elif facing == 2:
			$Sprite.frame = 4
		return
		
	#$Sprite.texture = StandTexture
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var attack = Input.is_action_just_pressed("attack")
	
	direction = Vector2()
	if up:
		#$Sprite.texture = BackTexture
		direction.y = -1
	elif down:
		#$Sprite.texture = FrontTexture
		direction.y = 1
		
	if right:
		direction.x = 1
	elif left:
		direction.x = -1
		
	facing()
	
	match facing:
		0: 
			$BasicAttack.position = $Top.position
			$Sprite.frame = 2
		1:
			$BasicAttack.position = $Right.position
			$Sprite.frame = 0
			$Sprite.flip_h = false
		2: 
			$BasicAttack.position = $Down.position
			$Sprite.frame = 1
		3: 
			$BasicAttack.position = $Left.position
			$Sprite.frame = 0
			$Sprite.flip_h = true
		
	if attack:
		$BasicAttack.act(facing)

	
	if up || down || right || left:
		move(delta)

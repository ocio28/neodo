extends "res://src/core/Human.gd"

func act(delta):
	if $BasicAttack.attacking:
		if facing == 1 || facing == 3:
			$Sprite.frame = 3
		elif facing == 2:
			$Sprite.frame = 4
		return
		
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var attack = Input.is_action_just_pressed("attack")
	
	$Sprite.set_z_index(0)
	if up:
		up()
		$Sprite.set_z_index(1)
	elif down:
		down()
		
	if right:
		right()
	elif left:
		left()
			
	if attack:
		$BasicAttack.act(facing)
	
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
			
	if up || down || right || left:
		move(delta)


func _on_Area2D_body_entered(body):
	take_damage(0, facingVector())



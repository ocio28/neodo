extends Camera2D

const SIZE = Vector2(384, 216)
const HALF = SIZE / 2
const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
const UP = Vector2(0, 1)
const DOWN = Vector2(0, -1)

export(NodePath) var targetPath

onready var target = get_node(targetPath)

var direction = null
var moveTarget = Vector2(0, 0)

func _physics_process(delta):
	if direction == null:
		if target.position.x < position.x - HALF.x:
			move(LEFT)
		if target.position.x > position.x + HALF.x:
			move(RIGHT)
		if target.position.y > position.y + HALF.y:
			move(UP)
		if target.position.y < position.y - HALF.y:
			move(DOWN)
	else:
		position += 500 * delta * direction
		if (direction.x < 0 && position.x <= moveTarget.x) || (direction.x > 0 && position.x >= moveTarget.x):
			position.x = moveTarget.x
			direction = null
			get_tree().paused = false
			#print('end', position, target.position)
		elif (direction.y < 0 && position.y <= moveTarget.y) || (direction.y > 0 && position.y >= moveTarget.y):
			position.y = moveTarget.y
			direction = null
			get_tree().paused = false
			#print('end', position, target.position)


func move(dir):
	get_tree().paused = true
	direction = dir
	moveTarget = position + SIZE * direction
	#print(dir, position, moveTarget, target.position)
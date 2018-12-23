extends Position2D

const LEFT = Vector2(-1, 0)
const RIGHT = Vector2(1, 0)
const UP = Vector2(0, 1)
const DOWN = Vector2(0, -1)

export(int) var limit_left = 0
export(int) var limit_right = 1
export(NodePath) var targetPath

onready var offset = position.x
onready var viewport = get_viewport().size
onready var half = get_viewport().size / 2
onready var target = get_node(targetPath)

var move_target = Vector2()
var move_direction = Vector2(0, 0)

func _ready():
	$Camera2D.limit_left = limit_left * viewport.x
	$Camera2D.limit_right = limit_right * viewport.x
	
func move(direction):
		get_tree().paused = true
		move_direction = direction
		move_target = position + viewport * direction

func _process(delta):
	#position.x = target.position.x
	#position.y = target.position.y
	
	if target.position.y < (position.y):
		move(DOWN)

	if target.position.y > (position.y):
		move(UP)
		
	if target.position.x < (position.x):
		move(LEFT)

	if target.position.x > (position.x):
		move(RIGHT)
			
	if move_target.y != 0:
		position.y += 700 * delta * move_direction.y
		if abs(position.y) >= abs(move_target.y):
			position.y = move_target.y
			move_target.y = 0
			get_tree().paused = false
			
	if move_target.x != 0:
		position.x += 700 * delta * move_direction.x
		if abs(position.x) >= abs(move_target.x):
			position.y = move_target.y
			move_target.x = 0
			get_tree().paused = false	
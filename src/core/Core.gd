extends Node

var state = null
var playing = false
var gameTime = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _process(delta):
	if playing:
		gameTime += delta
	
func new_game():
	gameTime = 0
	playing = true
	state = {
		square = false,
		triangle = false,
		circle = false,
		player = {
			maxHp = 2,
			hp = 2
		}
	}
	Utils.goto_game()
	
func you_lose():
	playing = false
	Utils.goto_youlose()
	
func you_win():
	if is_completed():
		playing = false
		Utils.goto_youwin()

func square():
	state.square = true
	
func triangle():
	state.triangle = true
	
func circle():
	state.circle = true

func is_completed():
	return state.square && state.circle && state.triangle
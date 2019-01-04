extends Node

var state = null
var playing = false
var gameTime = 0

	
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
		},
		bits = 0,
		items = [],
		keys = 0
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
	
func take_key():
	state.keys += 1
	
func use_key():
	state.keys -= 1

func exist_item(id):
	return state.items.find(id) > -1
	
func take_item(id):
	state.items.append(id)
	
func take_bit(amount):
	state.bits += amount
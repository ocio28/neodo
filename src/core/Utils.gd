extends Node

const path = "res://src/rooms"

var current_scene = null
var current_room = {
	name = path + "/outworld/Outroom.tscn",
	position = "Initial"
}


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	
func goto_game():
	goto_scene("Game")
	
func goto_youwin():
	goto_scene("YouWin")
	
func goto_youlose():
	goto_scene("YouLose")

func goto_bonusroom(room, position):
	current_room.name = path + room + ".tscn"
	current_room.position = position
	goto_scene("Game")

func goto_scene(name):
	# This function will usually be called from a signal callback,
	# or some other function from the running scene.
	# Deleting the current scene at this point might be
	# a bad idea, because it may be inside of a callback or function of it.
	# The worst case will be a crash or unexpected behavior.

	# The way around this is deferring the load to a later time, when
	# it is ensured that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", "res://src/scenes/" + name + ".tscn")

func _deferred_goto_scene(path):
	# Immediately free the current scene,
	# there is no risk here.
	current_scene.free()

	# Load new scene
	var scene = ResourceLoader.load(path)
	if scene == null:
		print('Escena no encontrada.', path)
		return
	# Instance the new scene
	current_scene = scene.instance()

	# Add it to the active scene, as child of root
	get_tree().get_root().add_child(current_scene)
	
func to_time(time):
	var minutes = int(floor((time / 60))) % 60
	var seconds = int(floor(time)) % 60
	#var milis = floor(fmod(time, 10) * 10000)
	#print(time, ':', milis, ':', fmod(time, 10))

	var txt = ""
	
	if minutes < 10:
		txt += "0"
	txt += str(minutes) + ":"
	
	if seconds < 10:
		txt += "0"
	txt += str(seconds)
	#txt += ":" + str(floor((time - int(time)) / 1000) * 1000)
	
	return txt

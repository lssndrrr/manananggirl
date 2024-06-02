extends Node

#var babies = 3
#var fished = false

# add randomizer for scenes
var Night1 = "res://Scenes/Night1.tscn"
var Night2 = "res://Scenes/Night2.tscn"
var Night3 = "res://Scenes/Night3.tscn"

var current_scene = "Night1"
var transition_scene = false

var player_start_posX = 50
var player_start_posY = 25

func finish_changeScenes():
	transition_scene = false
	#fished = false
		
	if current_scene == "Night1":
		current_scene = "Night2"
	elif current_scene == "Night2":
		current_scene = "Night3"
	elif current_scene == "Night3":
		current_scene = "Night1"

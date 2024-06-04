extends Node

# From day levels
var quota = 3
var time = 300.0 #in seconds

# Global variables
var score = 0
var fished = false
var finished = false

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
	finished = false
		
	if current_scene == "Night1":
		current_scene = "Night2"
	elif current_scene == "Night2":
		current_scene = "Night3"
	elif current_scene == "Night3":
		current_scene = "Night1"
		
func add_score():
	score += 1

func lose():
	pass
	# change tree scene to lose screen
	
func win():
	pass
	# change tree scene to win screen

extends Node

# From day levels
var quota = 3
var time = 300.0 #in seconds
var difficulty = 1 # 1 - easy; 2 -n medium; 3 - hard; 4 - impossible; 5 - seriously

# Global variables
var score = 0
var fished = false
var finished = false

# add randomizer for scenes
var Night1 = "res://Scenes/Levels/Night/Night1.tscn"
var Night2 = "res://Scenes/Levels/Night/Night2.tscn"
var Night3 = "res://Scenes/Levels/Night/Night3.tscn"

#day levels
var Day = "res://Scenes/Levels/Day/Day1.tscn"

#game state
var state

func get_day_strings() -> Array:
	if difficulty == 1:
		return ["scan_network;", "access_patient_records;", "bypass_antivirus;", "copy_database_backup;", "deploy_keylogger;", "view_public_records;"]
	return []

var current_scene = "Night1"
var transition_scene = false

var player_start_posX = 50
var player_start_posY = 25

func finish_changeScenes():
	transition_scene = false
	finished = false
	fished = false

	if current_scene == "Night1":
		current_scene = "Night2"
	elif current_scene == "Night2":
		current_scene = "Night3"
	elif current_scene == "Night3":
		current_scene = "Night1"

func add_score():
	score += 1

func lose(): # change tree scene to lose screen
	get_tree().change_scene_to_file("res://Scenes/Lose.tscn")

func win(): # change tree scene to win screen
	get_tree().change_scene_to_file("res://Scenes/Win.tscn")

extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_restart_pressed():
	Global.lives = 3
	Global.difficulty = 1
	get_tree().change_scene_to_file("res://Scenes/Storyline/TV.tscn")
	
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

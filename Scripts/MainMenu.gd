extends Control

func _ready():
	Global.state = "MainMenu"
	$VBoxContainer/StartBtn.grab_focus()

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/Storyline/TV.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()

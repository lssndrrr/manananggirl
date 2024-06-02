extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position.x = Global.player_start_posX
	$Player.position.y = Global.player_start_posY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene1()

func _on_night_1_trans_body_entered(body):
	if body.has_method("player"): #Global.fished and 
		Global.transition_scene = true

func _on_night_1_trans_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
		
func change_scene1():
	if Global.transition_scene == true:
		if Global.current_scene == "Night1":
			get_tree().change_scene_to_file(Global.Night2)
			Global.finish_changeScenes()

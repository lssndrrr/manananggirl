extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.state = "Night"
	Music.music()
	#$Player.position.x = Global.player_start_posX
	#$Player.position.y = Global.player_start_posY
	
	Global.fished = false
	Global.finished = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene3()

func _on_night_3_trans_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true

func _on_night_3_trans_body_exited(body):
	if body.has_method("player"):
		Global.transition_scene = false
		
func change_scene3():
	if Global.transition_scene == true:
		if Global.current_scene == "Night3":
			get_tree().change_scene_to_file(Global.Night1)
			Global.finish_changeScenes()

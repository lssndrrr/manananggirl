extends Node2D

@onready var interaction_area = $InteractionArea

var game = preload("res://Scenes/Game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position.x = Global.player_start_posX
	$Player.position.y = Global.player_start_posY

	interaction_area.interact = Callable(self, "_on_interact")
	Global.fished = false
	interaction_area.update_state(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene1()
		
func change_scene1():
	if Global.score >= Global.quota:
		Global.win()
	elif Global.transition_scene == true && Global.fished == true && Global.score < Global.quota:
		if (Global.current_scene == "Night1"):
			get_tree().change_scene_to_file(Global.Night2)
			Global.finish_changeScenes()
			
func _on_interact():
	if Global.fished == false:
		var instance = game.instantiate()
		instance.position = Vector2(500, 250)
		
		add_child(instance)
		update_state()
		
func update_state():
	interaction_area.update_state(true)

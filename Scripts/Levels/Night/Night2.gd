extends Node2D

@onready var interaction_area = $InteractionArea

var game = preload("res://Scenes/Game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.state = "Night"
	Music.music()
	
	$Player.position.x = Global.player_start_posX
	$Player.position.y = Global.player_start_posY
	$HUD.visible = true
	
	interaction_area.interact = Callable(self, "_on_interact")
	interaction_area.update_state(false)
	
	Global.fished = false
	Global.finished = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	change_scene2()

func change_scene2():
	if Global.score >= Global.quota:
		if Global.difficulty == 5:
			Global.win()
		Global.difficulty +=1
	elif Global.transition_scene == true && Global.fished == true && Global.score < Global.quota:
		if (Global.current_scene == "Night2"):
			Global.finish_changeScenes()
			$HUD.visible = false
			TransitionScreen.transition()
			await get_tree().create_timer(0.5).timeout
			get_tree().change_scene_to_file(Global.Night3)
			await TransitionScreen.on_transition_finished

func _on_interact():
	if Global.fished == false:
		var instance = game.instantiate()
		instance.position = Vector2(450, 250)

		add_child(instance)
		update_state()

func update_state():
	interaction_area.update_state(true)

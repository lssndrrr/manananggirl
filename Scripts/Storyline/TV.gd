extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_skip_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Day/Day.tscn")

func _on_animated_sprite_2d_animation_finished():
	get_tree().change_scene_to_file("res://Scenes/Levels/Day/Day.tscn")

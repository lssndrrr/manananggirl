extends Node2D

var hookVelocity = 0;
var hookAcceleration = .1;
var hookDeceleration = .2
var maxVelocity = 3.0;
var bounce = .3

var fishable = true
var fish = preload("res://Scenes/Fish.tscn")
@onready var fish_sfx = $Fishing
@onready var string_sfx = $String

func _ready():
	fish_sfx.play()
	spawn()
	
func spawn():
	if Global.difficulty == 1:
		spawn_easy()
	elif Global.difficulty == 2:
		spawn_medium()
	elif Global.difficulty == 3:
		spawn_hard()
	elif Global.difficulty == 4:
		spawn_impossible()
	elif Global.difficulty == 5:
		spawn_seriously()

func _process(delta):
	if ($Clicker.button_pressed == true || Input.is_action_just_pressed("ui_accept")):
		if hookVelocity > -maxVelocity:
			hookVelocity -= hookAcceleration
	else:
		if hookVelocity < maxVelocity:
			hookVelocity += hookDeceleration
			
	if (Input.is_action_just_pressed("ui_accept")):
		hookVelocity -= .5
		
	var target = $Hook.position.y + hookVelocity
	if (target >= 280):
		hookVelocity *= -bounce
	elif (target <= 38):
		hookVelocity = 0
		$Hook.position.y = 38
	else:
		$Hook.position.y = target

	# Adjust Value
	if (fishable == false):
		if (len($Hook/Area2D.get_overlapping_areas()) > 0):
			$Progress.value += 125 * delta
			if ($Progress.value >= 999):
				caught_fish()
		else:
			$Progress.value -= 100 * delta
			if ($Progress.value <= 0):
				lost_fish()
		
func caught_fish():
	get_node("Fish").destroy()
	$Progress.value = 0
	fishable = true

	Global.add_score()
	Global.fished = true
	stop_sfx()
	destroy()
	
func lost_fish():
	get_node("Fish").destroy()
	$Progress.value = 0
	fishable = true
	string_sfx.play()
	spawn()
	
func stop_sfx():
	fish_sfx.stop()
	
func add_fish(min_d, max_d, move_speed, move_time):
	var f = fish.instantiate()
	f.position = Vector2($Hook.position.x, $Hook.position.y)
	
	f.min_distance = min_d
	f.max_distance = max_d
	f.movement_speed = move_speed
	f.movement_time = move_time
	
	add_child(f)
	$Progress.value = 200
	fishable = false
	
func destroy():
	get_parent().remove_child(self)

#func _on_IncreaseSpeed_pressed():
	#maxVelocity += .5
	#update_labels()
#
#func _on_DecreaseSpeed_pressed():
	#maxVelocity -= .5
	#update_labels()
#
#func _on_IncreaseAcceleration_pressed():
	#hookAcceleration += .05
	#update_labels()
#
#func _on_DecreaseAcceleration_pressed():
	#hookAcceleration -= .05
	#update_labels()
#
#func _on_IncreaseDeceleration_pressed():
	#hookDeceleration += .05
	#update_labels()
#
#func _on_DecreaseDeceleration_pressed():
	#hookDeceleration -= .05
	#update_labels()
#
#func _on_IncreaseBounce_pressed():
	#bounce += .05
	#update_labels()
#
#func _on_DecreaseBounce_pressed():
	#bounce -= .05
	#update_labels()
#
#func reset_settings():
	#hookAcceleration = .1;
	#hookDeceleration = .2
	#maxVelocity = 6.0;
	#bounce = .6
	#
	#update_labels()

func spawn_easy():
	if (fishable):
		add_fish(10, 40, 8, 3)
		fishable = false

func spawn_medium():
	if (fishable):
		add_fish(30, 80, 4, 2)
		fishable = false

func spawn_hard():
	if (fishable):
		add_fish(40, 100, 4, 1.5)
		fishable = false

func spawn_impossible():
	if (fishable):
		add_fish(60, 140, 3, 1)
		fishable = false

func spawn_seriously():
	if (fishable):
		add_fish(85, 160, 2, 1)
		fishable = false

func _on_Clicker_button_down():
	hookVelocity -= .5

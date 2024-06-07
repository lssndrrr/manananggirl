extends Node2D

@onready var current_line = null
@onready var current_letter_index: int = -1
@onready var lines_typed: int = 0
@onready var keebsounds = [$keeb1, $keeb2, $keeb3, $keeb4]
@onready var wrongkey = $wrongkey
var current_sound_index = -1  # Start with an invalid index
var timer_duration = 10.0
var time_left = timer_duration
var timer

func _ready():
	Global.state = "Day"
	Music.music()
	timer = $Delay
	timer.wait_time = 0.5 # Delay in seconds
	timer.one_shot = true # Timer will stop after timeout
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))

	
	update_label()
	$Screen.choose_random_lines()
	new_line()

func new_line():
	update_label()
	var prompt = $Screen.get_prompt()
	if prompt is bool and prompt == false:
		print("all done")
		get_tree().change_scene_to_file(Global.Night1)
	else:
		current_line = prompt
		current_letter_index = 0


func _unhandled_input(event:InputEvent) -> void:
	#if event is InputEventKey and not event.is_pressed():
		#var typed_event = event as InputEventKey
		#var has_shift = typed_event.shift_pressed
		#var key_typed
		# var key_typed = PackedByteArray([typed_event.get_keycode_with_modifiers()]).get_string_from_utf8()
	#var key_typed
	if event is InputEventKey && event.is_pressed() && !event.is_echo():
			var typed_event = event as InputEventKey
			var key_typed: String = PackedByteArray([typed_event.unicode]).get_string_from_utf8()
			print(key_typed)

		#print(key_typed)
		
			if current_line == null:
				new_line()
			else:
				var next_char = current_line.substr(current_letter_index, 1)
				if next_char == key_typed:
					play_random_sound()
					print("you typed: ", key_typed, " ", current_letter_index, "/", current_line.length())
					current_letter_index += 1
					$Screen.get_colored_text(current_letter_index, current_line)
					if current_letter_index == current_line.length():
						lines_typed +=1
						current_letter_index = -1
						new_line()
				elif typed_event.keycode == KEY_SHIFT:
					print("here")
				else:
					wrongkey.play()
					Global.lives -=1
					update_lives_label()
					if Global.lives <= 0:
						timer.start()
					print("wrong key typed: ", key_typed, next_char)

func _process(delta):
	pass
	
func play_random_sound():
	var new_sound_index = randi() % keebsounds.size()
	while new_sound_index == current_sound_index:
		new_sound_index = randi() % keebsounds.size()

	current_sound_index = new_sound_index
	keebsounds[current_sound_index].play()


func _on_Timer_timeout():
	Global.lose()
	
func update_label():
	$Label.text = "Lines:" + str(lines_typed) +"/"+ str(Global.quota)

func update_timer_label():
	$Label.text = "Time Left: " + str(time_left)
	
func update_lives_label():
	var lives_text = ""
	for i in range(3):
		if i < 3 - Global.lives:
			lives_text += "[color=red]X[/color]"
		else:
			lives_text += "X"
	$Lives.text = lives_text

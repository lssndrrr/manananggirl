extends Node2D

@onready var current_line = null
@onready var current_letter_index: int = -1
@onready var lines_typed: int = 0

func _ready():
	Global.state = "Day"
	Music.music()
	
	$Screen.choose_random_lines()
	new_line()

func new_line():
	var prompt = $Screen.get_prompt()
	if prompt is bool and prompt == false:
		print("all done")
		get_tree().change_scene_to_file(Global.Night1)
	else:
		current_line = prompt
		current_letter_index = 0


func _unhandled_input(event:InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		var has_shift = typed_event.shift_pressed
		var key_typed
		# var key_typed = PackedByteArray([typed_event.get_keycode_with_modifiers()]).get_string_from_utf8()
		
		match has_shift:
			true:
				if typed_event.keycode == KEY_MINUS:
					key_typed = '_'
				else:
					key_typed = char(typed_event.keycode)
			false:
				key_typed = char(typed_event.keycode).to_lower()

		print(key_typed)
		
		if current_line == null:
			new_line()
		else:
			var next_char = current_line.substr(current_letter_index, 1)
			if next_char == key_typed:
				print("you typed: ", key_typed, " ", current_letter_index, "/", current_line.length())
				current_letter_index += 1
				$Screen.get_colored_text(current_letter_index, current_line)
				if current_letter_index == current_line.length():
					current_letter_index = -1
					new_line()
			else:
				print("wrong key typed: ", key_typed, next_char)

func _process(delta):
	pass

extends Node2D

var current_line = null
var current_letter_index: int = -1
var max_line = 5

func next_line(typed_character: String):
	var prompt = $Screen.get_prompt()
	if prompt.substr(0, 1) == typed_character:
		current_line = $Screen
		current_letter_index = 1


func _unhandled_input(event:InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		var has_shift = typed_event.shift_pressed
		var key_typed = PackedByteArray([typed_event.get_keycode_with_modifiers()]).get_string_from_utf8()
		
		match has_shift:
			true:
				print(key_typed)
			false:
				print(key_typed.to_lower())
				key_typed = key_typed.to_lower()
		
		if current_line == null:
			next_line(key_typed)
		else:
			var prompt = current_line.get_prompt()
			var next_char = prompt.substr(current_letter_index, 1)
			print("yay %s", key_typed)
			current_letter_index += 1
			if current_letter_index == prompt.length():
				current_letter_index = -1
				current_line.queue_free()
				current_line = null
			else:
				print("naur %s instead of %s", key_typed, next_char )

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

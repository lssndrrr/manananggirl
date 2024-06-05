extends RichTextLabel


@onready var prompt = self
@onready var timer = $Timer
@onready var strings = Global.get_day_strings()

var lines = []

func choose_random_lines():
	strings.shuffle()
	lines = strings.slice(0, Global.quota)
	self.text = lines[0]
	return lines

func get_prompt():
	if lines:
		self.text = lines[0]
		return lines.pop_front()
	else:
		return false

func get_colored_text(index: int, current_line: String):
	var colored_text = ""
	var before_text = current_line.left(index-1)
	var remaining_text = current_line.substr(index)
	colored_text = "[color=green]"+  before_text + current_line[index-1] + "[/color]" + remaining_text
	self.text = colored_text

extends RichTextLabel


@onready var prompt = self
@onready var prompt_text = self.text


func get_prompt() -> String:
	return prompt_text
	

func set_char(next_char_index):
	prompt.parse_bbcode()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

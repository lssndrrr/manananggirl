extends RichTextLabel


@onready var prompt = self
@onready var prompt_text = self.text


func get_prompt() -> String:
	return prompt_text

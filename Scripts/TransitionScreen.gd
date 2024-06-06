extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation = $AnimationPlayer

func _ready():
	color_rect.visible = false
	animation.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation.play("fade_out")
	elif anim_name == "fade_out":
		color_rect.visible = false
	
func transition():
	color_rect.visible = true
	animation.play("fade_to_black")


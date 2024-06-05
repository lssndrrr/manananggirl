class_name SceneTrigger extends Area2D

func _on_body_entered(_body):
	Global.transition_scene = true


func _on_body_exited(_body):
	Global.transition_scene = false

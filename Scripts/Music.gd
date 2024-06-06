extends Node2D

@onready var day = $Day
@onready var night = $Night

func music():
	if Global.state == "Day" && (night.playing || !day.playing && !night.playing):
		night.stop()
		day.play()
	elif Global.state == "Night" && (day.playing || !day.playing && !night.playing):
		day.stop()
		night.play()
	elif (Global.state == "Day" && day.playing) || (Global.state == "Night" && night.playing):
		pass
	else:
		day.stop()
		night.stop()

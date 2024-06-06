extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = $Timer
	timer.start(float(Global.time))
	update_time()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_time()

func update_time():
	var timer = $Timer
	var time = $Time
	Global.time = "%.2f" % (timer.get_time_left())
	time.text = str(Global.time)

func _on_timer_timeout():
	Global.lose()

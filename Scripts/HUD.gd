extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready ():
	update_count()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_count()

func update_count():
	var count = $Count
	count.text = str(Global.score) + "/" + str(Global.quota)

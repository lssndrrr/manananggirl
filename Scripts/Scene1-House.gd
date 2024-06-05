extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var Sprite = $Sprite2D

#var root = get_tree().root
#var game = preload("res://Scenes/Game.tscn")
#var scripted = preload("res://Scripts/Night1.gd")

# Called when the node enters the scene tree for the first time.
#func _ready():
	#interaction_area.interact = Callable(self, "_on_interact")


	##var g = game.instantiate()
	##g.position = Vector2(250, interaction_area.position.y)
	#
	##add_child(g)
	##var g = get_node("Game")
	##
	###g.visible = true
	##Night1.create_instance()
	#
	#var instance = scripted.new()
	#
	#var node = instance.create_instance()
	#
	#
	#
	##var instance = game.instantiate()
	##instance.position = Vector2(500, 250)
	##
	##var node = get_node("../Night1")
	##node.add_child(instance)
	##
	##await instance
	##
	##instance.destroy()

extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var left = 0
var right = 1

@onready var sprite2D = $AnimatedSprite2D

var animate = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Global.fished && !Global.finished:
		animate = true
		
	if !animate:		
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		var isLeft = velocity.x > 0
		
		if velocity.x != 0:
			sprite2D.flip_h = isLeft

		move_and_slide()
		current_camera()
	else:
		sprite2D.play("eat")
		sprite2D.scale = Vector2(2, 2)

		await get_tree().create_timer(3.3).timeout
				
		animate = false
		Global.finished = true
		sprite2D.scale = Vector2(1, 1)
		sprite2D.play("fly")

func player():
	pass

func current_camera():
	if Global.current_scene == "Night1":
		$Night1_camera.enabled = true
		$Night2_camera.enabled = false
		$Night3_camera.enabled = false
	elif Global.current_scene == "Night2":
		$Night1_camera.enabled = false
		$Night2_camera.enabled = true
		$Night3_camera.enabled = false
	elif Global.current_scene == "Night3":
		$Night1_camera.enabled = false
		$Night2_camera.enabled = false
		$Night3_camera.enabled = true

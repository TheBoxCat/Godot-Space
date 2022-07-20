extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	# Start velocity at zero
	velocity = Vector2()
	# 8-directional movement
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	velocity = velocity.normalized() * speed
	return velocity

func _physics_process(delta):
	# Point sprite at mouse
	look_at(get_global_mouse_position())
	
	# Use get_input function above
	get_input()
	
	# Set velocity
	velocity = move_and_slide(velocity)

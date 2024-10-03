extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var is_dragged = false

var jump_boost = 0.0

func _physics_process(delta: float) -> void:
	
	if is_dragged:
		global_position = get_global_mouse_position()
		#var mouse_direction = get_global_mouse_position() - global_position
		#velocity += mouse_direction.normalized() * 500 * delta
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY + jump_boost * JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event.is_class("InputEventMouseButton"):
		
		is_dragged = event.is_pressed()
		print(event)
			
	pass # Replace with function body.

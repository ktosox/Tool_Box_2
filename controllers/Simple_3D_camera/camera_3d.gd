extends Node3D

@export var move_speed = 12

@export var sensitivity := 0.003
@export var pitch_limit := 89.0

var pitch := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_position(delta)
	
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_camera(event.relative)

func update_position(delta: float) -> void:
	# turns ui_arrow_input to vector
	var move_vector = Vector2(Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right"), Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down"))
	move_vector = move_vector.normalized()
	move_vector = move_vector.rotated(-rotation.y)
	global_position.z -= move_vector.y * delta * move_speed
	global_position.x -= move_vector.x * delta * move_speed
	print(rotation," / ",move_vector)
	pass

func rotate_camera(delta):
	var dx = -delta.x * sensitivity
	var dy = -delta.y * sensitivity
	rotate_y(dx) # apply yaw on this node
	pitch += dy
	pitch = clamp(pitch, deg_to_rad(-pitch_limit), deg_to_rad(pitch_limit))
	$Camera3D.rotation.x = pitch

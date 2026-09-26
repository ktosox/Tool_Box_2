extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_vector = Vector2(Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right"), Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down"))
	move_vector = move_vector.normalized()
	global_position.z -= move_vector.y * delta * 18
	global_position.x -= move_vector.x * delta * 18
	pass

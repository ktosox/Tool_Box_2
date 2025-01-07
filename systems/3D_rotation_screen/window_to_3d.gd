extends SubViewportContainer

var mouse_tracked = false

var last_mouse_pos : Vector2

@export var rotation_speed = 1.2

func _process(delta: float) -> void:
	if mouse_tracked:
		
		var new_mouse_pos = $SubViewport.get_mouse_position()
		var difference = new_mouse_pos - last_mouse_pos
		$SubViewport/World/ObjectHolder.rotate_x(difference.y * delta * rotation_speed)
		$SubViewport/World/ObjectHolder.rotate_y(difference.x * delta * rotation_speed)

		last_mouse_pos = new_mouse_pos
		pass

func replace_held_object(new_object : Node3D) -> void:
	if $SubViewport/World/ObjectHolder.get_child_count() > 0:
		$SubViewport/World/ObjectHolder.get_child(0).queue_free()
	$SubViewport/World/ObjectHolder.add_child(new_object)
	pass

func _on_gui_input(event: InputEvent) -> void:
	if event.is_class("InputEventMouseButton"):
		last_mouse_pos = $SubViewport.get_mouse_position()
		mouse_tracked = event.is_pressed()
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	
	mouse_tracked = false
	pass # Replace with function body.

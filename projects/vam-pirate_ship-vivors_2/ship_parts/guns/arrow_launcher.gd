extends Gun

@export var target : Node2D

@export var arrow_scene : PackedScene 

func shoot(global_pos):
	var new_arrow = arrow_scene.instantiate()
	new_arrow.global_position = $PlaceArrowHere.global_position
	new_arrow.target_global = global_pos
	get_tree().current_scene.add_child(new_arrow)


func _on_fire_arrow_pressed() -> void:
	shoot(target.global_position)
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	shoot(target.global_position)
	pass # Replace with function body.

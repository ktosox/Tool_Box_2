extends RayCast2D

@export var attack_data : AttackData

func _ready() -> void:
	attack_data.attack_source = self

func _on_button_pressed() -> void:
	force_raycast_update()
	var collider = get_collider()
	if collider != null :
		collider.hit_detection(attack_data,get_collision_point())
	pass # Replace with function body.

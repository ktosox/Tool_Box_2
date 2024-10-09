extends Node2D

@export var attack_data : AttackData

var shot_scene = preload("res://experimental/example_gun_shot.tscn")


func _ready() -> void:
	pass

#func _on_button_pressed() -> void:
	#
	
	#pass # Replace with function body.
func shoot():
	var new_shot = shot_scene.instantiate() as RayCast2D
	new_shot.attack_data = attack_data
	
	add_child(new_shot)
	new_shot.global_position = $PlaceBulletsHere.global_position
	pass


func _on_timer_timeout() -> void:
	print("pew")
	shoot()
	pass # Replace with function body.

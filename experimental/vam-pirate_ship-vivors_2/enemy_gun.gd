extends Node2D

var bullet_scene = preload("res://experimental/vam-pirate_ship-vivors_2/test_bullet.tscn")

var target : CharacterBody2D

const SHOT_SPREAD = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if is_instance_valid(target):
		look_at(target.global_position + target.velocity * 0.8)
	pass

func shoot():
	var new_bullet = bullet_scene.instantiate() as Node2D
	
	new_bullet.global_position = $Marker2D.global_position
	new_bullet.global_rotation = global_rotation + randf_range(-SHOT_SPREAD,SHOT_SPREAD)
	get_parent().add_child(new_bullet)
	
	pass


func _on_timer_timeout() -> void:
	shoot()
	pass # Replace with function body.




func _on_detector_target_acquired(target: Node2D) -> void:
	self.target = target
	$Timer.start()
	pass # Replace with function body.


func _on_detector_target_lost() -> void:
	self.target = null
	$Timer.stop()
	pass # Replace with function body.

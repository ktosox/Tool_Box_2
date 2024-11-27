extends Area2D

#generic Area2D node for detecting things
#to make it work: add colision shape, set collison mask and define target groups

signal target_acquired(target : Node2D)

signal target_lost

@export var tracked_groups = ["player"]

var current_target : Node2D

func body_valid_check(body: Node2D) -> bool:
	var is_valid = false
	if tracked_groups.size() == 0:
		is_valid = true
	else:
		for group in tracked_groups:
			if body.is_in_group(group):
				is_valid = true
	return is_valid


func _on_body_entered(body: Node2D) -> void:
	if is_instance_valid(current_target):
		return
	if body_valid_check(body):
		current_target = body
		emit_signal("target_acquired",current_target)
		$SanityCheck.start()
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body == current_target:
		
		if get_overlapping_bodies().size()>0:
			for potential_target in get_overlapping_bodies():
				if body_valid_check(potential_target):
					current_target = potential_target
					emit_signal("target_acquired",current_target)
					return
		
		emit_signal("target_lost")
		current_target = null
		$SanityCheck.stop()
		
		
	pass # Replace with function body.


func _on_sanity_check_timeout() -> void:
	if !is_instance_valid(current_target):
		if get_overlapping_bodies().size()>0:
			for potential_target in get_overlapping_bodies():
				if body_valid_check(potential_target):
					current_target = potential_target
					emit_signal("target_acquired",current_target)
					return
		
		emit_signal("target_lost")
		current_target = null
		$SanityCheck.stop()
	pass # Replace with function body.

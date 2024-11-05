extends CharacterBody2D

var explosion_scene = preload("res://experimental/vam-pirate_ship-vivors_2/explosion.tscn")

const SPEED = 190.0

const MIN_SPEED_DISTANCE = 500

const MAX_SPEED_DISTANCE = 40

var target : CharacterBody2D



func _physics_process(delta: float) -> void:
	
	if target == null:
		return
	var follow_direction = target.global_position - global_position

	velocity = follow_direction.normalized() * lerp(0.0, SPEED, clamp(inverse_lerp(MIN_SPEED_DISTANCE, MAX_SPEED_DISTANCE, follow_direction.length()),0.0,1.0 ) )



	move_and_slide()


func explode():
	var new_explosion = explosion_scene.instantiate()
	new_explosion.global_position = global_position
	get_parent().add_child(new_explosion)
	queue_free()
	pass

func _on_detector_target_acquired(target: Node2D) -> void:
	self.target = target
	pass # Replace with function body.


func get_hit(data : AttackData):
	explode()
	pass

func _on_detector_target_lost() -> void:
	target = null
	pass # Replace with function body.


func _on_colision_range_body_entered(body: Node2D) -> void:
	if body != self:
		explode()
	pass # Replace with function body.

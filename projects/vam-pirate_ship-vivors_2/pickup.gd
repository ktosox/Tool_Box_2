extends CharacterBody2D


const SPEED = 330.0

var target : CharacterBody2D

const MIN_SPEED_DISTANCE = 400

const MAX_SPEED_DISTANCE = 60


func _physics_process(delta: float) -> void:
	
	if target == null:
		return
	var follow_direction = target.global_position - global_position

	velocity = follow_direction.normalized() * lerp(0.0, SPEED, clamp(inverse_lerp(MIN_SPEED_DISTANCE, MAX_SPEED_DISTANCE, follow_direction.length()),0.0,1.0 ) )

	move_and_slide()


func _on_detector_target_acquired(target: Node2D) -> void:
	self.target = target
	pass # Replace with function body.


func _on_collect_range_body_entered(body: Node2D) -> void:
	queue_free()
	pass # Replace with function body.

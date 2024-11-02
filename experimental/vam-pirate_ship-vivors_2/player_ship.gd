extends CharacterBody2D

const MOVE_SPEED = 300.0

const TURN_SPEED = 2.0

func _physics_process(delta: float) -> void:



	var direction := Vector2(0,Input.get_axis("ui_up", "ui_down"))

	velocity = direction.normalized().rotated(rotation) * MOVE_SPEED
	
	rotate(delta * Input.get_axis("ui_left","ui_right") * TURN_SPEED)
	
	move_and_slide()

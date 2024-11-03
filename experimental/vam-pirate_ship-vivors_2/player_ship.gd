extends CharacterBody2D

const MOVE_SPEED = 300.0

const MOVE_ACCELERATION = 400.0

const TURN_SPEED = 2.5

func _physics_process(delta: float) -> void:



	var direction := Vector2(0,Input.get_axis("ui_up", "ui_down"))

	velocity = velocity.move_toward(direction.normalized().rotated(rotation) * MOVE_SPEED, MOVE_ACCELERATION * delta) 
	
	rotate(delta * Input.get_axis("ui_left","ui_right") * lerp(TURN_SPEED * 0.2,TURN_SPEED,(velocity.length()/MOVE_SPEED)) )
	
	move_and_slide()


func _on_timer_timeout() -> void:
	print(velocity.length()/MOVE_SPEED)
	pass # Replace with function body.

extends CharacterBody2D

var move_speed = 300.0

var move_acceleration = 400.0

var turn_speed = 2.5

func _physics_process(delta: float) -> void:

	var direction := Vector2(0,Input.get_axis("ui_up", "ui_down"))

	velocity = velocity.move_toward(direction.normalized().rotated(rotation) * move_speed, move_acceleration * delta) 
	
	rotate(delta * Input.get_axis("ui_left","ui_right") * lerp(turn_speed * 0.2,turn_speed,(velocity.length()/move_speed)) )
	
	move_and_slide()

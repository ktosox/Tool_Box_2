extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:



	var direction := Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))

	velocity = direction.normalized() * SPEED

	move_and_slide()

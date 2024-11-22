extends CharacterBody2D

var move_speed = 300.0

var move_acceleration = 400.0

var turn_speed = 2.5

var current_body : Node2D

func _physics_process(delta: float) -> void:

	var direction := Vector2(0,Input.get_axis("ui_up", "ui_down"))

	velocity = velocity.move_toward(direction.normalized().rotated(rotation) * move_speed, move_acceleration * delta) 
	
	rotate(delta * Input.get_axis("ui_left","ui_right") * lerp(turn_speed * 0.2,turn_speed,(velocity.length()/move_speed)) )
	
	move_and_slide()


func apply_part(part : ShipPart) -> bool: #returns if it worked
	# check what type of part was given
	
	# if it's a body -> pass it to apply_body
	if part.type == ShipPart.Part_Flavour.HULL:
		apply_body(part)
	# if it's an item -> pass it to apply_item

	
	return true
	
func apply_body(part : ShipPart) -> void: # takes in a ship part assumed to be a body
	
	if current_body != null: # deletes existing body if one exists
		current_body.queue_free()
	add_child(part) # attaches new body
	current_body = part
	# sets varaible like speed or turn
	for key in part.special_properties.keys():
		self.set(key,part.special_properties[key])
	pass

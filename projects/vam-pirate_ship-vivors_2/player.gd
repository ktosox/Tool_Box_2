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
	
	match part.type:
		ShipPart.Part_Flavour.HULL:
			apply_body(part)
		ShipPart.Part_Flavour.WEAPON:
			apply_weapon(part)
		ShipPart.Part_Flavour.TOOL:
			apply_tool(part)
		_:
			return false

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

func apply_weapon(part : ShipPart, slot = -1) -> int:
	var selected_slot : Node2D
	if slot == -1: # find the first empty slot
		for index in $WeaponSlots.get_child_count():
			if $WeaponSlots.get_child(index).get_child_count() == 0:
				slot = index
				break
		if slot == -1: # all slots are taken - so pick one at random and overwrite it
			slot = randi()%$WeaponSlots.get_child_count()
			remove_weapon(slot)
	selected_slot = $WeaponSlots.get_child(slot)
	part.global_position = selected_slot.global_position
	selected_slot.add_child(part)

	return slot

func remove_weapon(slot : int):
	$WeaponSlots.get_child(slot).queue_free()
	
	pass

func apply_tool(part : ShipPart) -> int:
	var slot_ID : int
	for index in $ToolHolder.get_child_count():
		if $ToolHolder.get_child(index).get_child_count() == 0:
			slot_ID = index
			break
	if slot_ID == null: # all taken
		slot_ID = randi()%$ToolHolder.get_child_count()
		remove_tool(slot_ID)
		
	var selected_slot = $ToolHolder.get_child(slot_ID)
	part.global_position = selected_slot.global_position
	selected_slot.add_child(part)
	return slot_ID

func remove_tool(slot : int):
	$ToolHolder.get_child(slot).queue_free()

	pass

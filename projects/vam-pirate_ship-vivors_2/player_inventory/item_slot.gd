extends ColorRect

@export_enum("ALL","WEAPON","TOOL") var acceptable_items : int

var is_empty = true

var held_item : ItemData

func _get_drag_data(at_position: Vector2) -> Variant:
	if is_empty:
		return
	var item_preview = $ItemTexture.duplicate()
	set_drag_preview(item_preview)
	return [self,held_item]
	pass

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return is_item_valid(data[1])

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var donor_slot = data[0]
	if donor_slot != null: # assume that data[0] is the slot that previoulsy held dragged item
		if is_empty:
			donor_slot.remove_item()
		else:
			if !donor_slot.is_item_valid(held_item):
				return
			donor_slot.take_item(held_item)
		
	take_item(data[1])

func take_item(item : ItemData):
	held_item = item
	update_item_preview()
	is_empty = false
	pass



func is_item_valid(item: ItemData) -> bool:
	if acceptable_items == 0 :
		return true
	if item.type == acceptable_items:
		return true
	return false


func remove_item():
	held_item = null
	is_empty = true
	update_item_preview()
	pass


func update_item_preview():
	if held_item == null:
		$ItemTexture.texture = null
		self_modulate = Color.WHITE
		return
	$ItemTexture.texture = held_item.texture
	match held_item.type:
		0:
			self_modulate = Color.BLACK
		1:
			self_modulate = Color.RED
		2:
			self_modulate = Color.BLUE
		3:
			self_modulate = Color.DARK_GRAY
	pass

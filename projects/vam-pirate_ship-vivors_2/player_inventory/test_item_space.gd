extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_create_random_item_pressed() -> void:
	var new_item = ItemData.new()
	new_item.texture = load(new_item.valid_item_textures[randi()%3])
	new_item.type = randi()%4
	$ItemSlot.take_item(new_item)
	pass # Replace with function body.

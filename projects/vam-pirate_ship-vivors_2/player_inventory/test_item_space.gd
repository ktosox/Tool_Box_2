extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_create_random_item_pressed() -> void:
	var new_item = ItemData.new()
	new_item.type = randi()%4
	new_item.texture = load("res://resources/ui_icons/pirate/piranha.png")
	$ItemSlot.take_item(new_item)
	pass # Replace with function body.

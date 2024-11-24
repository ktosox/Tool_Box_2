extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_part_selected(part: PackedScene) -> void:
	$Player.apply_part(part.instantiate())
	pass # Replace with function body.


func _on_weapon_part_selected(part: PackedScene) -> void:
	$Player.apply_part(part.instantiate())
	pass # Replace with function body.


func _on_tool_part_selected(part: PackedScene) -> void:
	$Player.apply_part(part.instantiate())
	pass # Replace with function body.

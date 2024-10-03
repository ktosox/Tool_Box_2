extends Node2D

@export var text : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/Label.text = text
	pass # Replace with function body.



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
	pass # Replace with function body.

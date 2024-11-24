extends HBoxContainer

signal part_selected(part : PackedScene)

@export var part_A : ItemData

@export var part_B : ItemData

@export var part_C : ItemData

func _ready():
	$OptionA.texture_normal = part_A.texture
	$OptionB.texture_normal = part_B.texture
	$OptionC.texture_normal = part_C.texture
	pass
	


func _on_option_a_pressed() -> void:
	$OptionA.disabled = true
	emit_signal("part_selected",part_A.payload)
	$OptionB.disabled = false
	$OptionC.disabled = false
	pass # Replace with function body.


func _on_option_b_pressed() -> void:
	$OptionB.disabled = true
	emit_signal("part_selected",part_B.payload)
	$OptionC.disabled = false
	$OptionA.disabled = false
	pass # Replace with function body.


func _on_option_c_pressed() -> void:
	$OptionC.disabled = true
	emit_signal("part_selected",part_C.payload)
	$OptionB.disabled = false
	$OptionA.disabled = false
	pass # Replace with function body.

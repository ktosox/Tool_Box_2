extends VBoxContainer

@export var top_offset = 10.0
@export var value_offset = 0.0
@export var bot_offset = 10.0

@onready var _inital_top_offset = top_offset
@onready var _inital_bot_offset = bot_offset


func update_value(new_value = value_offset) -> void:
	value_offset = new_value

	top_offset = _inital_top_offset
	bot_offset = _inital_bot_offset
	if new_value < 0 :
		$Value.color = Color("red")
		bot_offset = _inital_bot_offset - abs(new_value)
	if new_value > 0 :
		$Value.color = Color("green")
		top_offset = _inital_top_offset - abs(new_value)
	$Value.size_flags_stretch_ratio = abs(value_offset)
	$Top.size_flags_stretch_ratio = top_offset
	$Bot.size_flags_stretch_ratio = bot_offset
	

	pass

extends Control

@export var max_box_count = 24

var _current_value_box

var _value_box_scene = preload("./value_box.tscn")

var current_value = 100.0

var previous_value = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_add_next_value_box()


	_current_value_box.update_value()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func apply_trade(cost : float) -> void:
	#current_value += cost
	#print(current_value / previous_value)
	#
	print("cost: ",cost)
	_current_value_box.update_value( cost )
	
	pass


func _add_next_value_box() -> void:
	var previous_value_box = _current_value_box
	var new_value_box = _value_box_scene.instantiate()
	_current_value_box = new_value_box
	if previous_value_box != null:
		_current_value_box.top_offset = previous_value_box.top_offset
		_current_value_box.bot_offset = previous_value_box.bot_offset
		if previous_value_box.value_offset > 0 :
			_current_value_box.bot_offset += abs(previous_value_box.value_offset)
		else:
			_current_value_box.top_offset += abs(previous_value_box.value_offset)
	%ValueBoxContainer.add_child(new_value_box)
	if %ValueBoxContainer.get_child_count() > max_box_count:
		%ValueBoxContainer.get_child(0).queue_free()
	pass




func _on_button_pressed() -> void:
	
	_add_next_value_box()
	
	pass # Replace with function body.


func _on_trading_cycle_timeout() -> void:
	previous_value = current_value
	_add_next_value_box()
	_current_value_box.update_value()
	
	
	pass # Replace with function body.


func _on_test_trades_timeout() -> void:
	apply_trade(randi_range(-10,10)/2.0)
	pass # Replace with function body.
	
	#if new_value > value_offset:
		#top_offset -= abs(new_value)
#
	#elif new_value < value_offset:
		#bot_offset -= abs(new_value)
	#
	#if sign(new_value) != sign(value_offset):
		#if new_value > 0:
			#bot_offset += abs(value_offset)
		#elif new_value < 0:
			#top_offset += abs(value_offset)
	#
	#value_offset = new_value

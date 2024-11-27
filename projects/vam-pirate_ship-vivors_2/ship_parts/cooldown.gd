extends State

signal cooldown_completed

var wait_time : float

@export var cooldown_time = 0.5

func enter(msg = {}) -> void:
	wait_time = 0
	pass

func _process(delta: float) -> void:
	wait_time += delta
	if wait_time > cooldown_time:
		set_process(false)
		emit_signal("cooldown_completed")
	pass

func exit() -> void:
	
	pass

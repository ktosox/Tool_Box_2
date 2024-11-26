extends State

var wait_time : float

@export var warmup_time = 0.5

signal warmup_completed

func enter(msg = {}) -> void:
	wait_time = 0
	pass

func _process(delta: float) -> void:
	wait_time += delta
	if wait_time > warmup_time:
		emit_signal("warmup_completed")
		set_process(false)
	
	pass

func exit() -> void:
	
	pass

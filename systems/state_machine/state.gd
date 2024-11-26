@icon("./state.svg")

class_name State

extends Node

var state_machine : StateMachine

func _ready():
	set_process(false)
	set_physics_process(false)
	await owner.ready

func enter(msg = {}) -> void:
	
	pass

func _process(delta: float) -> void:
	
	pass

func exit() -> void:
	
	pass

@icon("./state.svg")

class_name State

extends Node

var stateMachine = null

func _ready():
	set_process(false)
	set_physics_process(false)
	await owner.ready

func enter(msg = {}):
	
	pass


func exit():
	
	pass

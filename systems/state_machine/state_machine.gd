@icon("./state_machine.svg")

class_name StateMachine

extends Node

@export var initial_state : NodePath

@onready var state = get_node(initial_state) as State

func _ready():
	await owner.ready
	for c in get_children():
		c.state_machine = self
		if c.get_child_count()>0: # check for child states
			for d in c.get_children():
				if d.is_class("State"):
					d.state_machine = self
	activate_state()


func transition_to(targetState : String, msg = {}): # change state to targetState and pass to it msg
	assert(has_node(targetState) )
	yeet_state()
	state = get_node(targetState)
	activate_state(msg)



func activate_state(msg = {}):
	print("activating: ",state)
	state.enter(msg)
	state.set_process(true)
	state.set_physics_process(true)


func yeet_state():
	state.set_process(false)
	state.set_physics_process(false)
	state.exit()

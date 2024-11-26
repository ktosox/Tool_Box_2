extends ShipPart

# weapon - follows target and shoots gun 

var target : Node2D

@export var warmup_delay = 0.5

@export var cooldown = 1.2

@export var bonus_damage = 0.0

@export var max_ammo = 10

var current_ammo = 0

var active_state = State_Names.Idle

enum State_Names {Idle,Warmup,Fire,Cooldown,NoAmmo}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fire() -> bool: # returnd true is shot fired and flase if no ammo
	print("pew")
	if $AutoLoader.is_stopped():
		$AutoLoader.start()
	return true
	pass




func _on_button_pressed() -> void:
	$StateMachine.transition_to("Warmup")
	pass # Replace with function body.


func _on_warmup_warmup_completed() -> void:
	if fire():
		$StateMachine.transition_to("cooldown")
	else:
		$StateMachine.transition_to("no")
	pass # Replace with function body.


func _on_auto_loader_timeout() -> void:
	current_ammo = min(max_ammo, current_ammo+1)
	if current_ammo == max_ammo:
		$AutoLoader.stop()
	pass # Replace with function body.

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
	if target != null:
		$Gun.look_at(target.global_position)
	pass


func attempt_attack() -> bool: # returns true if attack went off
	if current_ammo < 1:
		$StateMachine.transition_to("NoAmmo")
		if $AutoLoader.is_stopped():
			$AutoLoader.start()
		return false
	fire()
	
	return true

func fire() -> void:
	assert($StateMachine/Cooldown.is_processing() == false)
	print("pew")
	current_ammo -= 1
	if $AutoLoader.is_stopped():
		$AutoLoader.start()
	$StateMachine.transition_to("Cooldown")
	






func _on_warmup_warmup_completed() -> void:
	attempt_attack()
	pass # Replace with function body.


func _on_cooldown_cooldown_completed() -> void:
	attempt_attack()
	pass # Replace with function body.


func _on_auto_loader_timeout() -> void:
	
	current_ammo = min(max_ammo, current_ammo+1)
	
	if $StateMachine.state == $StateMachine/NoAmmo:
		attempt_attack()
	if current_ammo == max_ammo:
		$AutoLoader.stop()
	$Ammo.text = "Ammo: " + str(current_ammo)
	pass # Replace with function body.


func _on_target_enter_pressed() -> void:
	if $StateMachine.state == $StateMachine/Idle:
		$StateMachine.transition_to("Warmup")
	pass # Replace with function body.


func _on_target_exit_pressed() -> void:
	$StateMachine.transition_to("Idle")
	pass # Replace with function body.


func _on_detector_target_acquired(new_target: Node2D) -> void:
	target = new_target
	if $StateMachine.state == $StateMachine/Idle:
		$StateMachine.transition_to("Warmup")
	pass # Replace with function body.


func _on_detector_target_lost() -> void:
	$StateMachine.transition_to("Idle")
	target = null
	$Gun.rotation_degrees = 180
	pass # Replace with function body.

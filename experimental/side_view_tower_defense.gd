extends Node2D

# collision layers! - 3 for attacks   - 4 for targets


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$RayCast2D.force_raycast_update()
	print($RayCast2D.get_collider())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

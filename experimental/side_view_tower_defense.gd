extends Node2D

# collision layers! - 3 for attacks   - 4 for targets

var hits = 0.0

var misses = 0.0
func _ready() -> void:
	randomize()

# Called when the node enters the scene tree for the first time.
func update_hit_rate(result : bool):
	if result:
		hits +=1
	else:
		misses += 1
	
	$Label2.text = str( hits/(hits + misses))
	pass

extends CanvasLayer

@export var enemy_list : Array[PackedScene]

@export var spawn_point : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for enemy in enemy_list:
		%EnemySelector.add_item(enemy.get_state().get_node_name(0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_spawn_enemy_pressed() -> void:
	if enemy_list.size() == 0: # nothing to spawn?
		return
	var enemy_amount = int(%SpawnCount.text)
	if enemy_amount < 1:
		enemy_amount = 1 # make sure at least 1 enemy is spawned regadlresss of value
	for count in enemy_amount:
		var new_enemy = enemy_list[%EnemySelector.selected].instantiate()
		new_enemy.global_position = spawn_point.global_position + Vector2(randf_range(-100,100),randf_range(-100,100))
		get_parent().add_child(new_enemy)
		print("spawn_enemy: ",count)
	pass # Replace with function body.

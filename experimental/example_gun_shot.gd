extends RayCast2D

var attack_data : AttackData

func _ready() -> void:
	attack_data.attack_source = self


func send_attack():
	force_raycast_update()
	var collider = get_collider()
	if collider == null :
		print("shot missed")
		queue_free()
	else:
		
		collider.hit_detection(attack_data,get_collision_point())
	pass

func attack_reply(data : HitData):
	print("shot reply got")
	queue_free()
	
	pass


func _on_timer_timeout() -> void:
	send_attack()
	pass # Replace with function body.

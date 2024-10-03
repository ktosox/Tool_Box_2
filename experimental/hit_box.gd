extends Area2D

signal attack_received (attack_data : AttackData, impact_position : Vector2)


func hit_detection(data : AttackData, impact_position = Vector2.ZERO):
	emit_signal("attack_received",data, impact_position)

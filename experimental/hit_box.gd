extends Area2D

signal attack_received (data : AttackData, location : Vector2)


func hit_detection(data : AttackData, impact_location = Vector2.ZERO):
	emit_signal("attack_received",data, impact_location)

extends Area2D

signal attack_recived(data : AttackData)


func get_hit(data : AttackData):
	emit_signal("attack_recived", data)
	pass

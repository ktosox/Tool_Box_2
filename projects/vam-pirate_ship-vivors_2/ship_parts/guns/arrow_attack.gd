extends Path2D

@export var target_global : Vector2

var funny_vectors = [Vector2(32,-50),Vector2(0,-12),Vector2(-42,0),Vector2(-24,60),Vector2(19,30)]

func _ready() -> void:
	var RFV = funny_vectors[randi()%funny_vectors.size()]
	curve = Curve2D.new()
	curve.add_point(Vector2.ZERO,Vector2.ZERO,RFV)
	curve.add_point( (to_local(target_global)/2.0) + randf_range(0,260) * (to_local(target_global) ).orthogonal().normalized() * (2*(randi()%2)-1 ),RFV,-RFV)
	curve.add_point(to_local(target_global),-RFV)

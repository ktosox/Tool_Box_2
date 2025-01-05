extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_set_line_1_text_submitted(new_text: String) -> void:
	
	$Center/Line1.set_point_position(1, vector_from_angle(new_text))
	$CanvasLayer/Area.text = str(0.5 * $Center/Line1.points[1].length() * $Center/Line2.points[1].length() * sin($Center/Line1.points[1].angle_to($Center/Line2.points[1])))
	print(sin($Center/Line1.points[1].angle_to($Center/Line2.points[1])))
	pass # Replace with function body.


func _on_set_line_2_text_submitted(new_text: String) -> void:
	$Center/Line2.set_point_position(1, vector_from_angle(new_text))
	$CanvasLayer/Area.text = str(0.5 * $Center/Line1.points[1].length() * $Center/Line2.points[1].length() * sin($Center/Line1.points[1].angle_to($Center/Line2.points[1])))
	print(sin($Center/Line1.points[1].angle_to($Center/Line2.points[1])))
	pass # Replace with function body.


func vector_from_angle(angle : String) -> Vector2:
	var result = Vector2.from_angle(deg_to_rad(int(angle))) *10
	
	return result

extends Control

var all_combination_array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for R in 4:
		for P in 4:
			for S in 4:
				if R==1 and P==1 and S==1:
					pass
				elif R+P+S == 3:
					var new_combination = [R,P,S]
					all_combination_array.push_back(new_combination)

	print(all_combination_array)

	for A in all_combination_array.size():
		var new_top = Label.new()
		var new_side = Label.new()

		new_top.text = combination_to_string_vert(all_combination_array[A])
		new_side.text = combination_to_string(all_combination_array[A])
		$Top.add_child(new_top)
		$Side.add_child(new_side)

	for A in all_combination_array.size():
		for B in all_combination_array.size():
			var new_result = Label.new()
			new_result.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			var result : float
		
			result = do_math(all_combination_array[A],all_combination_array[B])
			new_result.text = " "+str(result)+ " "
			$Results.add_child(new_result)
	pass # Replace with function body.

func combination_to_string(comb:Array) -> String:
	var result : String
	result = "[ " + "R: " + str(comb[0]) + " P: " + str(comb[1]) + " S: " + str(comb[2]) + " ]"

	return result
func combination_to_string_vert(comb:Array) -> String:
	var result : String
	result = " R: " + str(comb[0]) +'\n'+ " P: " + str(comb[1]) +'\n'+ " S: " + str(comb[2])
	return result
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func do_math(left_array:Array,right_array:Array) -> int:
	
	var left_angle = array_to_angle(left_array)
	var right_angle = array_to_angle(right_array)
	
	var left_vector = Vector2.from_angle(deg_to_rad(left_angle) ) * 10
	
	var right_vector = Vector2.from_angle(deg_to_rad( right_angle) ) * 10
	print("left angle/vector: ",left_angle," ",left_vector, " - right angle/vector: ",right_angle," ",right_vector)

	var result = 0.5 * left_vector.length() * right_vector.length() * sin(left_vector.angle_to(right_vector))

	#print("left_angle: " + str(left_vector.angle() ) +" right_angle: " + str(right_vector.angle()) + " result: "+str(result)  )
	return result

func array_to_angle(combi:Array) -> float:
	var angle_map = {[3,0,0]:0,[2,1,0]:40,[1,2,0]:80,[0,3,0]:120,[0,2,1]:160,[0,1,2]:200,[0,0,3]:240,[1,0,2]:280,[2,0,1]:320}
	var result : float
	result = angle_map[combi]
	return result

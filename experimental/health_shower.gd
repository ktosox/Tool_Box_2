extends Node2D

@export var HP : int = 1:
	set(value):
		HP = value
		if HP < 0:
			$Control/Label.text = "HP: NaN"
		else:
			$Control/Label.text = "HP: " + str(value)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.HP = HP
		
	pass # Replace with function body.

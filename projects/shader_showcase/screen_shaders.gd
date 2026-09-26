extends HBoxContainer

# this thing handles:
# - collecting a list of shaders and putting them on the ItemList
# - accepting selections from ItemList and 
# - applying selections to DemoImage

@export var screen_shaders : Array[Shader]

func _ready():
	for shader in screen_shaders:
		
		pass
	pass

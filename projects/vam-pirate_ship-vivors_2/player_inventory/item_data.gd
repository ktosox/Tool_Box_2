extends Resource

class_name ItemData

enum Item_Flavour {NULL, WEAPON, TOOL, GARBAGE}

@export var type : Item_Flavour

@export var texture : Texture

@export var payload : PackedScene

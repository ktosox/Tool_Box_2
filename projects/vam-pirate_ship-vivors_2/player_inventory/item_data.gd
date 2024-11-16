extends Resource

class_name ItemData

enum Item_Flavour {NULL, WEAPON, TOOL, GARBAGE}

@export var type : Item_Flavour

var valid_item_textures = [
	"res://resources/ui_icons/pirate/anchor.png",
	"res://resources/ui_icons/pirate/barrel.png",
	"res://resources/ui_icons/pirate/brandy-bottle.png",
	]
var texture : Texture

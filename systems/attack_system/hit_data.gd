extends Resource
## A nice little package of data that contains feedback for the attack entity
class_name HitData

enum Result_Flavour {CONNECT, MISS, BLOCK}

@export var result : Result_Flavour ## Describes how the target reacted to an attack

var damage_taken : int

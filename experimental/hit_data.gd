extends Resource

class_name HitData

@export var result : ResultType # connected / miss / block etc.

enum ResultType {CONNECT, MISS, BLOCK}

var damage_taken : int

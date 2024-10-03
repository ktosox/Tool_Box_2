extends Resource

class_name AttackData

@export var damage : int # amount - assumed 1+

@export var attakc_type : int # bullet / laser / gas / explosion

@export var damage_type : int # elemental / heat / electric etc.

@export var penetration : int # amount - assumed 0+

@export var accuracy = 1.0 # 0-1 range / 0.0 - max spread / 0.25 - terrible aim / 0.5 - average aim / 0.75 - decent aim / 0.95 - expert sharp shooter

var attack_source : Node # the attack entity that originated this package

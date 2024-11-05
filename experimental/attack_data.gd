extends Resource
## A nice little package of data that holds everything needed to calulate damage recieved
class_name AttackData

enum Attack_Flavour {BULLET, LASER, EXPLOSION}

enum Damage_Flavour {STANDARD, MELEE, RANGE, ELEMENTAL}

@export var damage : int ## Amount of damage dealt by this attack - assumed 1+

@export var attack_type: Attack_Flavour 

@export var damage_type : Damage_Flavour

@export var penetration : int ## How deep does this attack penetrate - assumed 0+

@export var accuracy = 1.0 ## Range of 0 to 1 / 0.0 max spread / 0.25 bad / 0.5 average / 0.75 decent / 0.95 expert sniper

var attack_source : Node # the attack entity that originated this package

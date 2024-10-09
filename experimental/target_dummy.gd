extends Node2D

signal attack_landed (success : bool)

var floating_text_scene = preload("res://experimental/floating_text.tscn")

@export var starting_health = 400

@onready var health = starting_health

@export var armor = 0

@export var dodge = 0.0 # 0 - static box / 0.2 - something that moves / 0.5 - erratic walking / 0.75 - evasive manevours / 1.0 - neo from the matrix

func _ready() -> void:
	$HealthShower.HP = health

func process_attack(data : AttackData, location : Vector2):
	var new_floating_text = floating_text_scene.instantiate()
	var reply = HitData.new()
	if hit_calcualtion(dodge,data.accuracy) :
		new_floating_text.text = str(data.damage)
		health -= data.damage
		$HealthShower.HP = health
		emit_signal("attack_landed",true)
		reply.result = 0
	else:
		reply.result = 1
		new_floating_text.text = "miss"
		emit_signal("attack_landed",false)
	reply.damage_taken = data.damage
	add_child(new_floating_text)
	if data.attack_source != null:
		data.attack_source.attack_reply(reply)
	pass

func hit_calcualtion(dodge : float, accuracy : float) -> bool : # dodge vs accuracy - returns true on hit connecting
	var hit_chance = accuracy + 0.15 + (-0.5 * dodge)
	print("hit chance is: ",hit_chance)
	if hit_chance > randf() :
		return true
	else:
		return false
	pass

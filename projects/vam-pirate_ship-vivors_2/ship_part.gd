extends Node2D

class_name ShipPart 

enum Part_Flavour {HULL,WEAPON,TOOL}

@export var type : Part_Flavour

@export var special_properties = {}

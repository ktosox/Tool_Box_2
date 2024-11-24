extends SubViewportContainer

@export var load_this_on_start: PackedScene

@export_enum("OFF", "WOBBLE") var animation = "OFF"


func _ready() -> void:

	if load_this_on_start != null :
		update_shown_object(load_this_on_start)
	if animation != "OFF":
		$Animator.play(animation)



func update_shown_object(object : PackedScene):
	if $SubViewport/Scene/ObjectHolder.get_child_count()>0:
		$SubViewport/Scene/ObjectHolder.get_child(0).queue_free()
	$SubViewport/Scene/ObjectHolder.add_child(object.instantiate())
	pass

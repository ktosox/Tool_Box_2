extends ColorRect

@export var bus_name = "Master"

@export var title_overwrite : String

var _bus_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_bus_index = AudioServer.get_bus_index(bus_name)
	assert(_bus_index != -1)
	%MuteButton.button_pressed = AudioServer.is_bus_mute(_bus_index)
	%VolumeSlider.value = db_to_linear(AudioServer.get_bus_volume_db(_bus_index))
	$ExampleSound.bus = bus_name
	if title_overwrite.is_empty():
		%Title.text = bus_name
	else:
		%Title.text = title_overwrite
	pass # Replace with function body.
	
	


func _on_mute_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(_bus_index, toggled_on)
	pass # Replace with function body.





func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus_index, linear_to_db(value))
	if !$ExampleSound.playing:
		$ExampleSound.play()
	pass # Replace with function body.

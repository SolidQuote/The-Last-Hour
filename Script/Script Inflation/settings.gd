extends Button





func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0,value/5)



func _on_mute_toggled(_toggled_on):
	pass # Replace with function body.

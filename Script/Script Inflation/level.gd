extends Node2D
@onready var canvas_modulate = $CanvasModulate

func _process(delta):
	if Input.is_action_just_pressed("Dev"):
		canvas_modulate.color = Color(1, 1, 1)

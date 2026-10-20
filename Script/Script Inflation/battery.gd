extends Area2D

@export var energery_amount = 40
var player_in_range: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = body
		#print("Player is on the thou battery")

func _on_body_exited(body):
	if body == player_in_range:
		player_in_range = null
		#print("Player left the battery.")

func _unhandled_input(event: InputEvent) -> void:
	if player_in_range != null and event.is_action_pressed("interact"):
		print("Player picked up the thingy!")
		queue_free()
		
		if player_in_range.has_method("add_battery"):
			player_in_range.add_battery(energery_amount)

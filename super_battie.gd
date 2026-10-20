extends Area2D

@export var superBattie_amount = 1
var player_in_range: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = body
		#print("Player is on the thou superBattery")


func _on_body_exited(body):
	if body == player_in_range:
		player_in_range = null
		#print("Player left the superBattery.")

func _unhandled_input(event: InputEvent) -> void:
	if player_in_range != null and event.is_action_pressed("interact"):
		print("Player picked up the superThingy!")
		queue_free()
		
		if player_in_range.has_method("add_superBattie"):
			player_in_range.add_superBattie(superBattie_amount)

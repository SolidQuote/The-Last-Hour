extends Area2D

var genOn = false
@export var max_genBatties = 3
@export var genbatties = -1
@export var genBatties_inserted = 0
var player_in_range: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = body
		#print("Player is with Sheila")

func _on_body_exited(body):
	if body == player_in_range:
		player_in_range = null
		#print("Player left Sheila.")

func _unhandled_input(event: InputEvent) -> void:
	if player_in_range != null and event.is_action_pressed("interact"):
		if genOn == true:
			print("Sheila's already full and purring!")
		
		if player_in_range.superBattie >= 1:
			player_in_range.remove_superBattie(1)
			genBatties_inserted += 1
			print("Player has ", genBatties_inserted, " in Sheila!")
			
			if genBatties_inserted == max_genBatties:
				genOn = true
				print("Sheila's full and satisfied!")
		
		if genBatties_inserted != max_genBatties and player_in_range.superBattie == 0:
			print("Player has no batties to put in Sheila!")

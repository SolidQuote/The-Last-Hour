extends CharacterBody2D

const SPEED = 50.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * SPEED

	move_and_slide()

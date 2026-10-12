extends CharacterBody2D

const SPEED = 50.0

@export var max_energery = 100
@export var current_energery = 100
@export var balls_draining_rate = 1.0

@onready var fleshlight: PointLight2D = $FleshLight
@onready var player = $"."

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var dir = Input.get_vector("left", "right", "up", "down")
	velocity = dir * SPEED
	
	if dir != Vector2.ZERO:
		player.rotation = dir.angle() + PI / 2

	move_and_slide()

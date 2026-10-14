extends CharacterBody2D

const SPEED = 50.0

@export var max_energery = 100
@export var current_energery = 100
@export var balls_draining_rate = 10.0

@onready var pl = $PointLight2D
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

func _process(delta):
	if current_energery > 0:
		current_energery -= balls_draining_rate * delta
		current_energery = max(current_energery, 0.0)
	
	if current_energery < 75:
		pl.color = Color("201f1f")
		fleshlight.color = Color("979693")
	
	if current_energery < 40:
		pl.color = Color("1a1919")
		fleshlight.color = Color("686764")
	
	if current_energery < 10:
		pl.color = Color("0a0a0a")
		fleshlight.color = Color("262624")
	
	else:
		pl.color = Color("272626")
		fleshlight.color = Color("adaca9")

extends CharacterBody2D

const SPEED = 50.0

@export var max_energery = 100
@export var current_energery = 100
@export var balls_draining_rate = 2.0

@onready var light100 = preload("res://Images/Enitys/Player/FlashLight.png")
@onready var light75 = preload("res://Images/Enitys/Player/FlashLight(75%).png")
@onready var light40 = preload("res://Images/Enitys/Player/FlashLight(40%).png")
@onready var light15 = preload("res://Images/Enitys/Player/FlashLight(15%).png")

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
	
	if current_energery > 75:
		pl.color = Color("201f1f")
		fleshlight.texture = light100
		fleshlight.visible = true
		pl.visible = true
	
	elif current_energery > 40:
		pl.color = Color("1a1919")
		fleshlight.texture = light75
	
	elif current_energery > 15:
		pl.color = Color("0a0a0a")
		fleshlight.texture = light40
		fleshlight.visible = true
		pl.visible = true
	
	elif current_energery > 0:
		fleshlight.texture = light15
		pl.visible = false
	
	else:
		fleshlight.visible = false

func add_battery(amount: float) -> void:
	current_energery += amount
	current_energery = min(current_energery, max_energery)

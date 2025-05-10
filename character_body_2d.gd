extends CharacterBody2D

@export var speed = 400
@export var acceleration = 0

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#if(input_direction > 0):
	velocity = input_direction * speed# * acceleration

func _physics_process(delta):
	get_input()
	move_and_slide()

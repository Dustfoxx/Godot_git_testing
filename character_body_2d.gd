extends CharacterBody2D

# comments

@export var speed = 400
@export var acceleration = 0
@export var g = 9.82 * 2

var vx: float = 0;
var vy: float = 0;

func _init() -> void:
	print_debug("""
  _|_|_|                                            _|
_|          _|_|_|  _|_|_|      _|_|_|    _|_|_|  _|_|_|_|    _|_|_|
_|  _|_|  _|    _|  _|    _|  _|    _|  _|_|        _|      _|    _|
_|    _|  _|    _|  _|    _|  _|    _|      _|_|    _|      _|    _|
  _|_|_|    _|_|_|  _|    _|    _|_|_|  _|_|_|        _|_|    _|_|_|
									_|
								_|_|

  _|_|_|                            _|
_|          _|_|_|  _|_|_|  _|_|        _|_|_|      _|_|_|
_|  _|_|  _|    _|  _|    _|    _|  _|  _|    _|  _|    _|
_|    _|  _|    _|  _|    _|    _|  _|  _|    _|  _|    _|
  _|_|_|    _|_|_|  _|    _|    _|  _|  _|    _|    _|_|_|
														_|
													_|_|
	""")

func get_input(delta):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if(abs(input_direction.x) > 0 || abs(input_direction.y) > 0):
		if acceleration < 1:
			acceleration += 0.5*delta
		if acceleration > 1:
			acceleration = 1
		velocity = input_direction * speed * acceleration
	else:
		if acceleration > 0:
			acceleration -= 0.7*delta
		if acceleration < 0:
			acceleration = 0
		velocity *= acceleration 

func _physics_process(delta):
	get_input(delta)
	move_and_slide()

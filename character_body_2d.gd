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

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	vx = speed * input_direction.x
	
	if (input_direction.y >= 0):
		vy += g
	else:
		vy = -180 * 3	
	
	velocity = Vector2(vx, vy)

func _physics_process(delta):
	get_input()
	move_and_slide()

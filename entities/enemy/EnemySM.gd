extends "res://utils/simple_state_machine.gd"

func _ready():
	_change_state("chilling")

func chilling(_delta):
	if Time.exceeded(ts_started_state, 2):
		start_moving()

func start_moving():
	_change_state("moving", {"direction": Vector2.RIGHT if randf() > 0.5 else Vector2.LEFT})	

func moving(delta):
	o.global_position += 100 * delta * data.direction
	if Time.exceeded(ts_started_state, 2):
		_change_state("chilling")

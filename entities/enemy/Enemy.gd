extends Sprite

var current_state
var current_state_name
var ts_started_state
var state_vars = {}

func _ready():
	_change_state("chilling")

func _change_state(state_name):
	current_state = funcref(self, state_name)
	current_state_name = current_state.function
	ts_started_state = Time.now

func chilling(_delta):
	if Time.exceeded(ts_started_state, 2):
		_change_state("moving")
		state_vars = {"direction": Vector2.RIGHT if randf() > 0.5 else Vector2.LEFT}

func moving(delta):
	if Time.exceeded(ts_started_state, 2):
		_change_state("chilling")
	global_position += 100 * delta * state_vars["direction"]

func _process(delta):
	current_state.call_func(delta)

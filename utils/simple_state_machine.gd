extends Node
class_name SimpleStateMachine

var current_state
var current_state_name
var ts_started_state
var data = {}

func transition_to(state_name, new_data={}):
	ts_started_state = Time.now
	data = new_data
	current_state = funcref(self, state_name)
	current_state_name = current_state.function

func _physics_process(delta):
	current_state.call_func(delta)

extends Node

signal state_changed(current_state)

var current_state = null
var current_state_name = null
var states_map = {}

func initialize(start_state_name):
	for state in get_children():
		state.connect("transition", self, "change_state")
		states_map[state.name] = state
	current_state_name = start_state_name
	current_state = states_map[start_state_name]
	current_state.enter({})

func _physics_process(delta):
	current_state.update(delta)

func change_state(state_name, data):
	print(state_name)
	var previous_state_name = current_state_name
	current_state.exit()
	current_state = states_map[state_name]
	current_state_name = state_name
	current_state.enter(data)
	emit_signal("state_changed", previous_state_name, state_name)

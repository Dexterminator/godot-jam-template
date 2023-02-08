extends Node

onready var o = owner
var current_state
var current_state_name
var ts_started_state
var data = {}

func _change_state(state_name, new_data=null):
	ts_started_state = Time.now
	if new_data == null:
		new_data = {}
	data = new_data
	current_state = funcref(self, state_name)
	current_state_name = current_state.function

func _physics_process(delta):
	current_state.call_func(delta)

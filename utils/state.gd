extends Node
class_name State

# warning-ignore:unused_signal
signal transition(next_state_name)
var state_machine

func enter(_data):
	pass

func exit():
	pass

func update(_delta):
	pass

func transition_to(state_name, data = {}):
	state_machine.transition_to(state_name, data)
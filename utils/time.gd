extends Node

var now = 0

func exceeded(ts_started, duration):
	if not ts_started:
		return true
	return now - ts_started > duration

func since(ts_started):
	if not ts_started:
		return INF
	return now - ts_started

func _physics_process(delta):
	now += delta

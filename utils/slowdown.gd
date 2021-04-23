extends Node

const end_value = 1
var time_start
var duration_ms
var start_value

func _ready():
	Engine.time_scale = 1
	set_process(false)

func start(duration = 0.4, strength = 0.9):
	time_start = OS.get_ticks_msec()
	duration_ms = duration * 1000
	start_value = 1 - strength
	Engine.time_scale = start_value
	set_process(true)

func circ_ease_in(t, b, c, d):
	t /= d
	return -c * (sqrt(1 - t * t) - 1) + b

func _process(_delta):
	var current_time = OS.get_ticks_msec() - time_start
	var value = circ_ease_in(current_time, start_value, end_value, duration_ms)
	if current_time >= duration_ms:
		set_process(false)
		value = end_value
	Engine.time_scale = value

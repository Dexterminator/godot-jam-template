extends "res://entities/player/player_state.gd"

onready var Easing = preload("res://utils/easing.gd")
const DURATION = 1.0
var ts_started

func enter(_data):
	ts_started = Time.now

func update(_delta):
	var a = Easing.Cubic.easeOut(Time.since(ts_started), 1, -0.7, DURATION)
	o.sprite.modulate = Color(1, 1, 1, a)

	if Time.exceeded(ts_started, DURATION):
		emit_signal("transition", "default", {})

func exit():
	o.sprite.modulate = Color(1, 1, 1, 1)

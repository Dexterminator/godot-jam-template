extends "res://entities/player/player_state.gd"

onready var Easing = preload("res://utils/easing.gd")
const DURATION = 3.0
var ts_started

func _hello():
	print("hello")
	emit_signal("transition", "default", {})

func enter(_data):
	ts_started = Time.now
	var anima := Anima.begin(self)
	anima.connect("animation_completed", self, "_hello")
	anima.then({node=o.sprite, animation="shake", duration=0.7})
	anima.then({node=o.sprite, animation="tada", duration=0.9})
	anima.then({node=o.sprite, property="x", to=1000, duration=0.9})
	anima.play()

func update(_delta):
	var a = Easing.Cubic.easeOut(Time.since(ts_started), 1, -0.7, DURATION)
	o.sprite.modulate = Color(1, 1, 1, a)

func exit():
	o.sprite.modulate = Color(1, 1, 1, 1)

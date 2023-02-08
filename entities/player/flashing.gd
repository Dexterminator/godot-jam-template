extends "res://entities/player/player_state.gd"

onready var Easing = preload("res://utils/easing.gd")
var ts_started

func _hello():
	print("hello")
	emit_signal("transition", "default", {})

func enter(_data):
	ts_started = Time.now
	var a := Anima.begin(self)
	a.connect("animation_completed", self, "_hello")
	a.then({node=o.sprite, animation="shake", duration=0.7})
	a.then({node=o.sprite, animation="tada", duration=0.9})
	a.then({node=o.sprite, property="x", to=1000, duration=0.9})
	a.play()
	print(Utils.random_choice([1,2,3]))

func update(_delta):
	var a = Easing.Cubic.easeOut(Time.since(ts_started), 1, -0.7, Constants.DURATION)
	o.sprite.modulate = Color(1, 1, 1, a)

func exit():
	o.sprite.modulate = Color(1, 1, 1, 1)

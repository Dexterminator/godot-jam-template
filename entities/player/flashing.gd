extends "res://entities/player/player_state.gd"

const Enemy = preload("res://entities/enemy/Enemy.tscn")
var ts_started

func _hello():
	print("hello")
	transition_to("default")

func enter(_data):
	ts_started = Time.now
	var tween = create_tween()
	tween.tween_property(o.sprite, "material:shader_param/flash_strength", 1.0, 0.3)
	tween.tween_property(o.sprite, "material:shader_param/flash_strength", 0.0, 0.3)
	tween.tween_callback(self, "_hello")
	Utils.spawn(Enemy, o.global_position + Vector2.RIGHT * 100)
	Shake.add_trauma(0.7)
	Slowdown.start(0.2)
	print(Utils.random_choice([1,2,3]))

func update(delta):
	o.sprite.modulate.a -= delta

func exit():
	o.sprite.modulate = Color(1, 1, 1, 1)

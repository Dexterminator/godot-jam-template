extends "res://entities/player/player_state.gd"

var ts_started

func _hello():
	print("hello")
	emit_signal("transition", "default", {})

func enter(_data):
	ts_started = Time.now
	var tween = create_tween()
	tween.tween_property(o.sprite, "material:shader_param/flash_strength", 1.0, 0.3)
	tween.tween_property(o.sprite, "material:shader_param/flash_strength", 0.0, 0.3)
	tween.tween_callback(self, "_hello")
	print(Utils.random_choice([1,2,3]))

func update(delta):
	o.sprite.modulate.a -= delta

func exit():
	o.sprite.modulate = Color(1, 1, 1, 1)

extends "res://entities/player/player_state.gd"

const SPEED = 300
var direction = Vector2.ZERO

func update(_delta):
	if Input.is_action_just_pressed("action1"):
		emit_signal("transition", "fading", {})
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO

	o.move_and_slide(direction * SPEED)

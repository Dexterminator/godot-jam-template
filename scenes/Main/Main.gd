extends Node2D

func _on_ShakeButton_pressed():
	Shake.add_trauma(0.5)

func _on_SlowButton_pressed():
	Slowdown.start()

func _on_ExitButton_pressed():
	get_tree().change_scene("res://scenes/Title/Title.tscn")

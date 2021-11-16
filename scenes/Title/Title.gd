extends Node

onready var selections_container = $MarginContainer/VBoxContainer/CenterContainer/VBoxContainer
onready var selection_count = selections_container.get_child_count()
onready var selections = selections_container.get_children()
var selection_index = 0
var selected_color

func _ready():
	selected_color = selections[0].modulate

func _start_game():
	SceneChanger.change_scene(self, "res://scenes/Main/Main.tscn")

func _start_tutorial():
	print("Start tutorial")

func _trigger_selection(selection):
	match selection.name:
		"Start":
			_start_game()
		"Tutorial":
			_start_tutorial()
		"Exit":
			get_tree().quit()

func _process(_delta):
	for s in selections:
		s.modulate = Color.white
	var selection = selections[selection_index]
	selection.modulate = selected_color

	if Input.is_action_just_pressed("ui_accept"):
		_trigger_selection(selection)
	elif Input.is_action_just_pressed("ui_down"):
		selection_index += 1
	elif Input.is_action_just_pressed("ui_up"):
		selection_index -= 1

	selection_index = clamp(selection_index, 0, selection_count - 1)

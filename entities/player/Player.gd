extends KinematicBody2D
class_name Player

onready var state_machine = $StateMachine
onready var sprite = $Sprite

var spawn_count = 0

func _ready():
	state_machine.initialize("default")

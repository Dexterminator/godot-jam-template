extends KinematicBody2D

onready var state_machine = $StateMachine
onready var sprite = $Sprite

func _ready():
	state_machine.initialize("default")

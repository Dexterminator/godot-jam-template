extends SimpleStateMachine

onready var o : Enemy = owner

func _ready():
	transition_to("state_chilling")

func state_chilling(_delta):
	if Time.exceeded(ts_started_state, 2):
		start_state_moving()

func start_state_moving():
	transition_to("state_moving", {"direction": Vector2.RIGHT if randf() > 0.5 else Vector2.LEFT})	

func state_moving(delta):
	o.global_position += 100 * delta * data.direction
	if Time.exceeded(ts_started_state, 2):
		transition_to("state_chilling")

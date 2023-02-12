extends CanvasLayer

onready var spawn_count_label = $VBoxContainer/SpawnCountLabel

func _update_spawn_count(spawn_count):
	spawn_count_label.text = "Spawn count: %s" % spawn_count

func _ready():
	_update_spawn_count(0)
	Events.connect("spawn_count_updated", self, "_update_spawn_count")

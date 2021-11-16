extends CanvasLayer

onready var black = $Black
onready var tween = $Tween
const DURATION = 0.2

func change_scene(current_scene_node, path, data = null):
	tween.interpolate_property(black, "modulate", Color(1,1,1,0), Color.white, DURATION)
	tween.start()
	current_scene_node.set_process(false)
	var root = get_tree().get_root()
	yield(get_tree().create_timer(DURATION), "timeout")
	root.remove_child(current_scene_node)
	current_scene_node.queue_free()
	var scene = load(path).instance()
	if data:
		scene.data = data
	root.add_child(scene)
	tween.interpolate_property(black, "modulate", Color.white, Color(1,1,1,0), DURATION)
	tween.start()

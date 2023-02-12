extends Node

func random_choice(arr):
	return arr[randi() % arr.size()]

func spawn(factory, pos, parent = null):
	if not parent:
		parent = SceneChanger.current_scene
	var node = factory.instance()
	node.global_position = pos
	parent.add_child(node)
	return node

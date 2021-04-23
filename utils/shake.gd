extends Node

func add_trauma(amount, max_amount = 1.0):
	get_tree().get_nodes_in_group("shake_camera")[0].add_trauma(amount, max_amount)

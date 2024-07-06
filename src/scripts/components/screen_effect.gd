extends Node
class_name ScreenEffect

@export var effect : PackedScene

func start():
	var n = effect.instantiate()
	n.global_position = get_parent().global_position
	get_tree().get_root().add_child(n)

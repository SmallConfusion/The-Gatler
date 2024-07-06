extends Node
class_name LockRotation

@export var rot : float = 0


func _process(delta):
	get_parent().global_rotation = rot

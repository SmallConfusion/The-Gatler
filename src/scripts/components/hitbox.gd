extends Area2D
class_name Hitbox


@export var root_node : Node

func _ready():
	if not root_node:
		root_node = get_parent()


func hit(damage : float):
	for sibling in root_node.get_children():
		if sibling is Health:
			sibling.damage(damage)

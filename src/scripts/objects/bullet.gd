extends Node2D
class_name Bullet


func set_forward(dir):
	for child in get_children():
		if child is BulletMovement:
			child.forward = dir

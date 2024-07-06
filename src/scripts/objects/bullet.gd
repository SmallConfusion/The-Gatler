extends Node2D
class_name Bullet


func set_forward(dir : Vector2):
	global_rotation = dir.angle()
	
	for child in get_children():
		if child is BulletMovement:
			child.forward = dir


func set_player_velocity(v : Vector2):
	for child in get_children():
		if child is BulletMovement:
			child.initial_velocity = v
	

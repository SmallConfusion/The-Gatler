extends Node2D
class_name Gun

@export var bullet_scene : PackedScene

func fire():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	bullet.set_forward(Vector2.from_angle(global_rotation))
	get_tree().get_root().add_child(bullet)
	

extends Node2D
class_name Gun

@export var bullet_scene : PackedScene
@export var spread := 0.1
@export var spread_concentration := 1.

@onready var spread_pow := spread ** spread_concentration

func fire():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	
	var bullet_forward_rotation : float = global_rotation
	
	var spread_value = randf_range(-spread, spread)
	
	bullet_forward_rotation += remap(abs(spread_value) ** spread_concentration * sign(spread_value), -spread_pow, spread_pow, -spread, spread)
	
	bullet.set_forward(Vector2.from_angle(bullet_forward_rotation))
	get_tree().get_root().add_child(bullet)
	

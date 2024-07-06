extends Node2D
class_name Gun

@export var bullet_scene : PackedScene

@export var cooldown : float = 1.

@export var spread := 0.1
@export var spread_concentration := 1.

@onready var spread_pow := spread ** spread_concentration

var cooldown_timer := 0.0


func _process(delta):
	cooldown_timer -= delta


func fire_cooldown():
	if cooldown_timer <= 0:
		cooldown_timer = cooldown
		_fire()


func _fire():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position
	
	var bullet_forward_rotation : float = global_rotation
	
	var spread_value = randf_range(-spread, spread)
	
	bullet_forward_rotation += remap(abs(spread_value) ** spread_concentration * sign(spread_value), -spread_pow, spread_pow, -spread, spread)
	
	bullet.set_forward(Vector2.from_angle(bullet_forward_rotation))
	
	if get_parent() is RigidBody2D: 
		bullet.set_player_velocity(get_parent().linear_velocity)
	get_tree().get_root().add_child(bullet)
	

extends Node
class_name BulletMovement

@export var speed := 1000.
var forward := Vector2.RIGHT


func _physics_process(delta):
	get_parent().position += forward * speed * delta

extends Node
class_name BulletMovement

var forward := Vector2.RIGHT
var speed := 1000.


func _physics_process(delta):
	get_parent().position += forward * speed * delta

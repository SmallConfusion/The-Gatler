extends Node
class_name Health

signal health_updated

@export var health := 1.0

@onready var original_health = health


func damage(d : float) -> void:
	health -= d
	
	if health <= 0:
		for sibling in get_parent().get_children():
			if sibling is Death:
				sibling.die()
	
	emit_signal("health_updated")


func get_health_fract() -> float:
	return health / original_health

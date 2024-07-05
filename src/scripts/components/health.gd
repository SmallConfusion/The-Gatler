extends Node
class_name Health

@export var health := 1.0

func damage(damage : float):
	health -= damage
	
	if health <= 0:
		for sibling in get_parent().get_children():
			if sibling is Death:
				sibling.die()

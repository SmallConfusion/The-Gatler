extends Area2D
class_name Hitbox


func hit(damage : float):
	for sibling in get_parent().get_children():
		if sibling is Health:
			sibling.damage(damage)

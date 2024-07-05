extends Node
class_name Hurtbox

@export var damage := 1.0
@export var self_damage := 1.0


func _on_area_entered(area):
	if area is Hitbox:
		area.hit(damage)
		
		for sibling in get_parent().get_children():
			if sibling is Health:
				sibling.damage(self_damage)

extends Area2D
class_name Hurtbox

signal hit

@export var damage := 1.0
@export var self_damage := 0.0


func _ready():
	connect("area_entered", _on_area_entered)


func _on_area_entered(area):
	if area is Hitbox:
		area.hit(damage)
		emit_signal("hit")
		
		for sibling in get_parent().get_children():
			if sibling is Health:
				sibling.damage(self_damage)

extends Area2D
class_name HitStaticbody


func _ready():
	connect("body_entered", _body_entered)


func _body_entered(body):
	for sibling in get_parent().get_children():
		if sibling is Death:
			sibling.die()

extends Node
class_name InnocentKilled


func _ready():
	for sibling in get_parent().get_children():
		if sibling is Death:
			sibling.connect("killed", Global.kill_innocent)
			break

extends Node
class_name ReloadOnDeath

func _ready():
	for sibling in get_parent().get_children():
		if sibling is Death:
			sibling.connect("killed", get_tree().reload_current_scene)

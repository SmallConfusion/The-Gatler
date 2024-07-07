extends Node
class_name ReloadOnDeath

func _ready():
	for sibling in get_parent().get_children():
		if sibling is Death:
			sibling.connect("killed", get_tree().change_scene_to_file.bind("res://scenes/menu/main_menu.tscn"))

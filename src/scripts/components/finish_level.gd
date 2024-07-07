extends Node
class_name FinishLevel

@export var level_index := 0
@export_file var next_scene := "res://scenes/menu/main_menu.tscn"

func finish_level():
	Global.unlocked_level = max(Global.unlocked_level, level_index+1)
	
	await get_tree().create_timer(1.).timeout
	
	get_tree().change_scene_to_file(next_scene)

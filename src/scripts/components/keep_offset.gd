extends Node
class_name KeepOffset

var original_offset : Vector2

func _ready():
	original_offset = get_parent().global_position - get_parent().get_parent().global_position


func _process(delta):
	get_parent().global_position = get_parent().get_parent().global_position + original_offset

extends Node
class_name KeepOffset

var original_offset : Vector2
var original_rotation : float

func _ready():
	original_offset = get_parent().global_position - get_parent().get_parent().global_position
	original_rotation = get_parent().global_rotation


func _process(delta):
	get_parent().global_position = get_parent().get_parent().global_position + original_offset
	get_parent().global_rotation = original_rotation

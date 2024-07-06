extends Node
class_name KeepRotation


var original_rotation : float

func _ready():
	original_rotation = get_parent().global_rotation


func _process(delta):
	get_parent().global_rotation = original_rotation

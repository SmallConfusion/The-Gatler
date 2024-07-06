extends Node
class_name KeepRotationRelative

var original_rotation : float

func _ready():
	var original_rotation = get_parent().get_parent().global_rotation


func _process(delta):
	get_parent().rotation = original_rotation - get_parent().get_parent().global_rotation

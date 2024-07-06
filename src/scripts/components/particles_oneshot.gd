extends Node
class_name ParticlesOneshot

func _ready():
	get_parent().one_shot = true

extends Node
class_name ParticlesNoAutoplay

func _ready():
	get_parent().emitting = false

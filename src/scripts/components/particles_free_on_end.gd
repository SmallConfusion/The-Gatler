extends Node
class_name ParticlesFreeOnEnd


func _ready():
	get_parent().connect("finished", get_parent().queue_free)

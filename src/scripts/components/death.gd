extends Node
class_name Death


func die():
	get_parent().queue_free()

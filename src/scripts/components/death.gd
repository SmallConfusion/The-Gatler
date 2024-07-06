extends Node
class_name Death

signal killed

func die():
	emit_signal("killed")
	get_parent().queue_free()

extends Offscreen
class_name FreeOffscreen


func _process(_delta):
	if not is_onscreen():
		get_parent().queue_free()

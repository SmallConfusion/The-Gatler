extends CanvasGroup

@export var debug := true

func _ready():
	if OS.is_debug_build() and debug:
		visible = false
	else:
		visible = true
		self_modulate = Color(1, 1, 1, 1)
		
		await get_tree().create_timer(2.0).timeout
		
		var tween = get_tree().create_tween().tween_property(self, "self_modulate", Color(1, 1, 1, 0), 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
		await tween.finished
		
		visible = false
	

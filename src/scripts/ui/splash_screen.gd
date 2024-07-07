extends CanvasGroup

func _ready():
	var debug_settings : DebugSettings = get_tree().get_first_node_in_group("debug_settings")
	
	if OS.is_debug_build() and debug_settings and debug_settings.hide_splash_screen:
		visible = false
	else:
		visible = true
		self_modulate = Color(1, 1, 1, 1)
		
		await get_tree().create_timer(2.0).timeout
		
		var tween = get_tree().create_tween().tween_property(self, "self_modulate", Color(1, 1, 1, 0), 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
		await tween.finished
		
		visible = false
	

extends LoadSceneButton
class_name LoadLevelButton

@export var level_index := 0

func _ready():
	if Global.unlocked_level < level_index:
		disabled = true
	
	var debug_settings : DebugSettings = get_tree().get_first_node_in_group("debug_settings")
	
	if OS.is_debug_build() and debug_settings and debug_settings.unlock_all_levels:
		disabled = false

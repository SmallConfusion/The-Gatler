extends LoadSceneButton
class_name LoadLevelButton

@export var level_index := 0

func _ready():
	var debug_settings : DebugSettings = get_tree().get_first_node_in_group("debug_settings")
	
	if Global.unlocked_level < level_index and (not debug_settings or not debug_settings.unlock_all_levels):
		disabled = true
	
	

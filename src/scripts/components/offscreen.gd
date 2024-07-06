extends Node
class_name Offscreen

@export var margin := 0

var screen_size := Vector2(1280/2, 720/2)

func _ready():
	var camera := get_viewport().get_camera_2d()
	
	if camera:
		screen_size /= camera.zoom.x

func is_onscreen():
	var camera := get_viewport().get_camera_2d()
	
	if camera:
		var camera_pos := camera.global_position
		
		var global_position = get_parent().global_position
		
		if global_position.x > camera_pos.x + screen_size.x + margin or \
			global_position.x < camera_pos.x - screen_size.x - margin or \
			global_position.y > camera_pos.y + screen_size.y + margin or \
			global_position.y < camera_pos.y - screen_size.y - margin:
			
				return false
		else:
				return true

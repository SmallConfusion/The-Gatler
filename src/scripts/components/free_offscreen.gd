extends Node2D
class_name FreeOffscreen

@export var margin := 32.

var screen_size := Vector2(1280/2, 720/2)

func _ready():
	var camera := get_viewport().get_camera_2d()
	
	if camera:
		screen_size /= camera.zoom.x

func _process(_delta):
	var camera := get_viewport().get_camera_2d()
	
	if camera:
		var camera_pos := camera.global_position
		
		if global_position.x > camera_pos.x + screen_size.x + margin or \
			global_position.x < camera_pos.x - screen_size.x - margin or \
			global_position.y > camera_pos.y + screen_size.y + margin or \
			global_position.y < camera_pos.y - screen_size.y - margin:
			
				get_parent().queue_free()

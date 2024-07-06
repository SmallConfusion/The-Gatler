extends Node
class_name GradientModulate

@export var nodes : Array[CanvasItem]
@export var gradient : GradientTexture1D

func _ready():
	var image := gradient.get_image()
	var color := image.get_pixel(randi_range(0, image.get_width()), 0)
	
	for node in nodes:
		node.modulate = color

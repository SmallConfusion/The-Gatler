@tool
extends Sprite2D

@export var index := 0

var original_position = Vector2(0, -7)
var t := 0.
var speed := 1.5


func _process(delta):
	t += delta
	var a = fmod(t * speed * TAU + TAU * index / 9 - global_rotation/2, TAU)
	position = (original_position * 2).rotated(a) * Vector2(1, .5)

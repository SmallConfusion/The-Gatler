extends Sprite2D

@export var duration := 1.0

func _ready():
	await get_tree().create_tween().tween_method(func(x): material.set_shader_parameter("t", x), 0., 1., duration)

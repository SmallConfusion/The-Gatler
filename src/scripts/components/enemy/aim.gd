extends Node2D
class_name Aim

@onready var player = get_tree().get_first_node_in_group("player")

func _process(delta):
	if is_instance_valid(player):
		var diff = player.global_position - global_position
		global_rotation = diff.angle()

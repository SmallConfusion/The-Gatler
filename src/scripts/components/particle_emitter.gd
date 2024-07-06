extends Node
class_name ParticleEmitter

@export var particles : Array[PackedScene]

func emit():
	for p_scene in particles:
		var p = p_scene.instantiate()
		p.global_position = get_parent().global_position
		p.global_rotation = get_parent().global_rotation
		get_tree().get_root().add_child(p)

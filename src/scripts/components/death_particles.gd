extends Death
class_name DeathParticles

@export var particles : Array[PackedScene]

func die():
	for p_scene in particles:
		var p = p_scene.instantiate()
		p.global_position = get_parent().global_position
		p.global_rotation = get_parent().global_rotation
		get_tree().get_root().add_child(p)
	
	super()

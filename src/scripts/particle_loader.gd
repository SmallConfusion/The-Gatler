extends Node2D

@export var particles : Array[PackedScene]

func _ready():
	await get_tree().create_timer(0.1).timeout
	
	for p_scene in particles:
		var p := p_scene.instantiate()
		
		if p is GPUParticles2D:
			_spawn(p)
		else:
			for child in p.get_children():
				if child is GPUParticles2D:
					_spawn(child)
		
	
	await get_tree().create_timer(1).timeout
	
	queue_free()
	

func _spawn(p : GPUParticles2D):
	for child in p.get_children():
		child.free()
	
	p.z_index = -100
	p.emitting = true
	p.one_shot = true
	add_child(p)

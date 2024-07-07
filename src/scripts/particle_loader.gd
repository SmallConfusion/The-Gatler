extends Node2D

@export var particles : Array[PackedScene]

func _ready():
	if Global.particles_loaded:
		queue_free()
		return
	
	Global.particles_loaded = true
	
	await get_tree().create_timer(0.1).timeout
	
	for p_scene in particles:
		var p := p_scene.instantiate()
		add_child(p)
		
	
	await get_tree().create_timer(1).timeout
	
	queue_free()

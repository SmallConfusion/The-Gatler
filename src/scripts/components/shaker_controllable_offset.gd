extends ShakerControllable
class_name ShakerControllableOffset


func _ready():
	intensity = 0
	speed = 0
	
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	
	for node in shake_nodes:
		op.append(node.offset)
		o_rotation.append(node.rotation)


func _process(delta):
	var i := 0.
	
	for node in shake_nodes:
		var x := noise.get_noise_2d(Time.get_ticks_msec() * speed, i * 100) * intensity
		var y := noise.get_noise_2d(Time.get_ticks_msec() * speed, (i + 0.3333) * 100) * intensity
		var r := noise.get_noise_2d(Time.get_ticks_msec() * speed, (i + 0.6667) * 100) * rotation_intensity
		
		node.offset = op[i] + Vector2(x, y)
		node.rotation = o_rotation[i] + r
		
		i += 1

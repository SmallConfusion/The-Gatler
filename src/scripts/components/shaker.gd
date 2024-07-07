extends Node
class_name Shaker

@export var shake_nodes : Array[Node2D]
@export var intensity := 1.0
@export var rotation_intensity := 0.
@export var speed := 1.0

var op : Array[Vector2]
var o_rotation : Array[float]

var p_position : Array[Vector2]
var p_rotation : Array[float]

var noise := FastNoiseLite.new()


func _ready():
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	
	for node in shake_nodes:
		op.append(node.position)
		o_rotation.append(node.rotation)
		
		p_position.append(Vector2.ZERO)
		p_rotation.append(0)

func _process(delta):
	var i := 0.
	
	for node in shake_nodes:
		var x := noise.get_noise_2d(Time.get_ticks_msec() * speed, i * 100) * intensity
		var y := noise.get_noise_2d(Time.get_ticks_msec() * speed, (i + 0.3333) * 100) * intensity
		var r := noise.get_noise_2d(Time.get_ticks_msec() * speed, (i + 0.6667) * 100) * rotation_intensity
		
		node.position = node.position - p_position[i] + Vector2(x, y)
		node.rotation = node.rotation - p_rotation[i] + r
		
		p_position[i] = Vector2(x, y)
		p_rotation[i] = r
		
		i += 1

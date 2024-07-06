extends Node
class_name Shaker

@export var shake : Array[Node2D]
@export var intensity := 1.0
@export var speed := 1.0

var op : Array[Vector2]

var noise := FastNoiseLite.new()


func _ready():
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	
	for node in shake:
		op.append(node.position)

func _process(delta):
	var i := 0.
	
	for node in shake:
		var x := noise.get_noise_2d(Time.get_ticks_msec() * speed, i * 100) * intensity
		var y := noise.get_noise_2d(Time.get_ticks_msec() * speed, (i + 0.5) * 100) * intensity
		
		node.position = op[i] + Vector2(x, y)
		
		i += 1

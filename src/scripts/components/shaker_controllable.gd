extends Shaker
class_name ShakerControllable

@export var shake_time := 0.1

@onready var original_intensity := intensity
@onready var original_rotation_intensity := rotation_intensity
@onready var original_speed := speed

var tween : Tween

func _ready():
	intensity = 0
	speed = 0
	
	super()


func shake() -> void:
	intensity = original_intensity
	rotation_intensity = original_rotation_intensity
	speed = original_speed
	
	if tween:
		tween.kill()
	
	tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "intensity", 0, shake_time)
	tween.tween_property(self, "rotation_intensity", 0, shake_time)
	tween.tween_property(self, "speed", 0, shake_time)

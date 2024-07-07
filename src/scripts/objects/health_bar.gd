extends Sprite2D
class_name HealthBar

var health : Health
var last_health := 1.

var tween : Tween

func _ready():
	for sibling in get_parent().get_children():
		if sibling is Health:
			health = sibling
			health.connect("health_updated", _update_health)
			break
	
	material.set_shader_parameter("t", 1)


func _update_health():
	if tween:
		tween.kill()
	
	if get_tree():
		tween = get_tree().create_tween()
	
		tween.tween_method(func(x : float): material.set_shader_parameter("t", x),
			last_health, health.get_health_fract(), 0.05).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	
	last_health = health.get_health_fract()


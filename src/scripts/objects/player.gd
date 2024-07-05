extends RigidBody2D

const SPEED := 1600.0
const ROTATION_CHANGE_FORCE := 3.

func _physics_process(delta):
	var pointing_direction := (get_global_mouse_position() - global_position)
	var force := Vector2.ZERO

	var rotation_change : float = pointing_direction.angle() - rotation
	
	if rotation_change > PI:
		rotation_change -= TAU
	elif rotation_change < -PI:
		rotation_change += TAU
	
	rotation += rotation_change * ROTATION_CHANGE_FORCE * delta
	
	if Input.is_action_pressed("Fire"):
		force = -Vector2.from_angle(rotation) * SPEED
		$Gun.fire_cooldown()
	
	apply_central_force(force)

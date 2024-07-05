extends RigidBody2D

const SPEED := 1600.0

func _physics_process(delta):
	var pointing_direction := (get_global_mouse_position() - global_position)
	var force := Vector2.ZERO

	rotation += (pointing_direction.angle() - rotation) * delta * 3.
	
	if Input.is_action_pressed("Fire"):
		force = -Vector2.from_angle(rotation) * SPEED
		$Gun.fire()
	
	apply_central_force(force)

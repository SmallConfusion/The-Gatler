extends RigidBody2D

const SPEED := 1200.0
const ROTATION_CHANGE_FORCE := 8.

@onready var gun_audio_tween : Tween

var gun_heat := 0.0

var heat_up_speed := 0.4
var cool_down_speed := 1.0


func _physics_process(delta):
	print(linear_velocity)
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
		
		gun_heat += delta * heat_up_speed
		$PlayerGunFire.emitting = true
	else:
		gun_heat -= delta * cool_down_speed
		$PlayerGunFire.emitting = false
	
	gun_heat = clamp(gun_heat, 0, 1)
	
	apply_central_force(force)
	
	RenderingServer.global_shader_parameter_set("gun_heat", gun_heat)
	
	$Skeleton2D/HeadTarget.global_position = lerp($Skeleton2D/HeadTarget.global_position, global_position + Vector2(100, 0).rotated((-pointing_direction).angle()), delta * 20)


	if Input.is_action_just_pressed("Fire"):
		if gun_audio_tween:
			gun_audio_tween.stop()
			
		$AudioStreamPlayer.volume_db = -5
		
		gun_audio_tween = get_tree().create_tween()
		gun_audio_tween.tween_property($AudioStreamPlayer, "volume_db", 0, 0.5)
		
		$AudioStreamPlayer.play()
	elif Input.is_action_just_released("Fire"):
		if gun_audio_tween:
			gun_audio_tween.stop()
		
		gun_audio_tween = get_tree().create_tween()
		gun_audio_tween.tween_property($AudioStreamPlayer, "volume_db", -50, 0.5)
		await gun_audio_tween.finished
		$AudioStreamPlayer.stop()

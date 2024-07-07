extends RigidBody2D

const SPEED := 1200.0
const ROTATION_CHANGE_FORCE := 8.

@onready var gun_audio_tween : Tween

var gun_heat := 0.0

var heat_up_speed := 0.6
var cool_down_speed := 0.4

var locked := false
var firing_cooldown := 0.2
var firing_cooldown_timer := 0.

var is_audio_going := false

func _physics_process(delta):
	firing_cooldown_timer -= delta
	
	var pointing_direction := (get_global_mouse_position() - global_position)
	var force := Vector2.ZERO

	var rotation_change : float = pointing_direction.angle() - rotation
	
	if rotation_change > PI:
		rotation_change -= TAU
	elif rotation_change < -PI:
		rotation_change += TAU
	
	rotation += rotation_change * ROTATION_CHANGE_FORCE * delta
	
	if Input.is_action_pressed("Fire") and not locked and firing_cooldown_timer <= 0:
		start_audio()
		force = -Vector2.from_angle(rotation) * SPEED
		$Gun.fire_cooldown()
		
		gun_heat += delta * heat_up_speed
		$PlayerGunFire.emitting = true
	else:
		if Input.is_action_just_released("Fire") and is_audio_going:
			firing_cooldown_timer = firing_cooldown
		
		stop_audio()
		gun_heat -= delta * cool_down_speed
		$PlayerGunFire.emitting = false
		if gun_heat <= 0 and locked:
			locked = false
	
	
	if gun_heat > 1.0:
		locked = true
		$GunLockSoundEffect.play_sound()
		$ScreenShake.shake()
	
	gun_heat = clamp(gun_heat, 0, 1)
	
	apply_central_force(force)
	
	$HeatBar.material.set_shader_parameter("t", gun_heat)
	$HeatBar.material.set_shader_parameter("red", locked)
	
	RenderingServer.global_shader_parameter_set("gun_heat", gun_heat)
	
	$Skeleton2D/HeadTarget.global_position = lerp($Skeleton2D/HeadTarget.global_position, global_position + Vector2(100, 0).rotated((-pointing_direction).angle()), delta * 20)



func start_audio():
	if not is_audio_going:
		is_audio_going = true
		if gun_audio_tween:
			gun_audio_tween.kill()
			
		$AudioStreamPlayer.volume_db = -5
		
		gun_audio_tween = get_tree().create_tween()
		gun_audio_tween.tween_property($AudioStreamPlayer, "volume_db", 0, 0.5)
		
		$AudioStreamPlayer.play()


func stop_audio():
	if is_audio_going:
		is_audio_going = false
		if gun_audio_tween:
			gun_audio_tween.kill()
		
		gun_audio_tween = get_tree().create_tween()
		gun_audio_tween.tween_property($AudioStreamPlayer, "volume_db", -50, 0.5)
		await gun_audio_tween.finished
		$AudioStreamPlayer.stop()

extends Node
class_name SoundEffect

@export var sounds : Array[AudioStream]

@export var min_volume := 0.
@export var max_volume := 0.

@export var min_pitch := 1.
@export var max_pitch := 1.

@export var bus := "sfx"

func play_sound():
	SoundManager.play_random_sound(sounds, randf_range(min_volume, max_volume), randf_range(min_pitch, max_pitch), bus)

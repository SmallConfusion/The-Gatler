@tool
extends Node


@export var start : bool = false :
	set(value):
		for child in get_children():
			if child is GPUParticles2D:
				child.restart()
				child.one_shot = true
				child.emitting = true


@export var no_oneshot : bool = false:
	set(value):
		for child in get_children():
			if child is GPUParticles2D:
				child.one_shot = false
				child.emitting = true

extends AudioStreamPlayer

func _ready():
	stream = preload("res://sounds/music/music.ogg")
	play()

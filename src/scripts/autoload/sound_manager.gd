extends Node

var players : Array[AudioStreamPlayer]= []

func play_sound(sound : AudioStream, volume : float = 0., pitch : float = 1., bus : String = "sfx") -> void:
	for player in players:
		if player.playing == false:
			player.volume_db = volume
			player.pitch_scale = pitch
			player.bus = bus
			player.stream = sound
			player.play()
			return
	
	var player = AudioStreamPlayer.new()
	player.stream = sound
	player.volume_db = volume
	player.pitch_scale = pitch
	player.bus = bus
	add_child(player)
	players.append(player)
	player.play()


func play_random_sound(sounds : Array[AudioStream], volume : float = 0., pitch : float = 1., bus : String = "sfx"):
	play_sound(sounds.pick_random(), volume, pitch, bus)


func stop_all_sounds() -> void:
	for player in players:
		player.stop()

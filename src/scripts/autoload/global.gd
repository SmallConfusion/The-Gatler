extends Node

var particles_loaded := false

var unlocked_level := 0

var innocents_killed := 0
var total_innocents_killed := 0

func kill_innocent():
	innocents_killed += 1
	total_innocents_killed += 1

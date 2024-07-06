extends Gun
class_name AutofireGun

@export var offscreen : Offscreen


func _process(delta):
	super(delta)
	
	if offscreen.is_onscreen():
		fire_cooldown()

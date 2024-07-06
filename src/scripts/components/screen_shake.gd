extends Node
class_name ScreenShake

@export var group_to_shake : String

func shake():
	get_tree().call_group(group_to_shake, "shake")

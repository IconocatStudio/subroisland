extends "res://Scripts/Pickup.gd"

func spawn_condition():
	return GameData.variables.get("planks_collected") != "true"


func do_what_this_object_does():
	.do_what_this_object_does()
	GameData.variables["planks_collected"] = "true"
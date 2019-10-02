extends "res://Scripts/Pickup.gd"

func spawn_condition():
	return GameData.variables.get("hammer_requested") == "true" &&  GameData.variables.get("hammer_collected") != "true"


func do_what_this_object_does():
	.do_what_this_object_does()
	GameData.variables["hammer_collected"] = "true"
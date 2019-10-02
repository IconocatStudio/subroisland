extends "res://Scripts/Pickup.gd"

func spawn_condition():
	return GameData.variables.get("delivered_pie") == "true" && GameData.variables.get("key_collected") != "true"


func do_what_this_object_does():
	.do_what_this_object_does()
	GameData.variables["key_collected"] = "true"
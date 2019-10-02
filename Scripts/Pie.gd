extends "res://Scripts/Pickup.gd"

func spawn_condition():
	return GameData.variables.get("need_yummy_pie") == "true" && GameData.variables.get("pie_collected") != "true"


func do_what_this_object_does():
	.do_what_this_object_does()
	GameData.variables["pie_collected"] = "true"
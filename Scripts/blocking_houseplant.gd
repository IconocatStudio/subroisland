extends "res://Scripts/DialogActor.gd"

func spawn_condition():
	return GameData.variables.get("hammer_requested") == "true" && GameData.variables.get("remove_plant") != "true"
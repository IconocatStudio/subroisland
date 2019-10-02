extends "res://Scripts/DialogActor.gd"

func spawn_condition():
	return GameData.variables.get("door_unlocked") != "true"
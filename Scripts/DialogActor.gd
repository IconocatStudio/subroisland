extends "res://Scripts/Actor.gd"

# Set what dialog this character has.
export(String) var dialog_option = "placeholder"

func interact():
	Global.Dialog.initiate(dialog_option)

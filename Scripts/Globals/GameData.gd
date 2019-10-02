extends Node

# This is the location of ALL non-dialog game data
var zone_load_spawn_point = 0
var zone_load_facing_direction = null

# Dialogues and variables taken from dialog system "progress.gd"
var dialogues = { # Everytime the player talks with an NPC it will be stored here so the system use the "repeat" block (if available) on the next interaction.
#	'question': true # This is here just for demonstration (and debugging) pourposes.
}

var variables = { # Variables used as conditions to know what dialogue block the player should see next.
#	var1 = true # This is here just for demonstration (and debugging) pourposes.
}

# Current design only ever has 1 item, but this could be changed
func add_to_inventory(item):
	var spr = item.get_node("Sprite")
	UI.inventory.add_icon_item(spr.texture)
	UI.inventory.set_item_icon_region(0, spr.region_rect)
	UI.inventory.set_item_selectable(0, false)


func remove_from_inventory():
	UI.inventory.remove_item(0)
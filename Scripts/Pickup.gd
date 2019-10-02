extends "res://Scripts/OverworldObject.gd"
var pickup_sound = load("res://Sound/Effects/pickup2.ogg")

func do_what_this_object_does():
    GameData.add_to_inventory(self)
    overworld.remove_from_active(self)
    $AudioStreamPlayer.stream = pickup_sound
    $AudioStreamPlayer.play()
    yield($AudioStreamPlayer, "finished")
    queue_free()
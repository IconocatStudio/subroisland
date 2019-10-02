extends Node

var Dialog

func game_over():
    UI.game_over()


func demo_over():
    UI.demo_over()


# TODO Get these function out of here
func delete_item():
    GameData.remove_from_inventory()


# Good idea, but seems like bad execution
func force_reprocess():
    get_tree().call_group("Terrain", "process_actor_spawn_conditions")
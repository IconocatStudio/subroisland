extends Node2D

onready var overworld = get_parent()

enum CELL_TYPES { ACTOR, OBJECT }
export(CELL_TYPES) var obj_type = CELL_TYPES.ACTOR

func do_what_this_object_does():
    print("I am an OverworldObject without no action defined.")


# An object can specify its condition for being preent in the scene by defining
# this method. By default, if an actor is present in the editor, it will be
# present in game.
func spawn_condition():
	return true
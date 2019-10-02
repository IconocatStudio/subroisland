extends Node

var dialog_active = false
var pause_menu_active = false
var pause_menu_allowed = false
var input_direction
var input_activation
var input_pause_menu

func _ready():
	# Do not disable this when game is paused
	set_pause_mode(PAUSE_MODE_PROCESS)

func _process(delta):
	input_direction = get_input_direction()
	input_activation = get_input_activation()
	input_pause_menu = get_input_pause_menu()
	if dialog_active:
		process_dialog()
	if input_pause_menu:
		toggle_pause_menu()
	# if pause_menu_active:
	# 	process_pause_menu()


func get_input_direction():
	var horizontal = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var vertical = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return Vector2(horizontal, vertical if horizontal == 0 else 0)


func get_input_activation():
	return Input.is_action_just_pressed("ui_accept")


func get_input_pause_menu():
	return Input.is_action_just_pressed("ui_menu")


func activate_dialog():
	dialog_active = true
	get_tree().paused = true


func deactivate_dialog():
	dialog_active = false
	get_tree().paused = false
	neutralize_inputs()


func process_dialog():
	if input_activation:
		Global.Dialog.next()


# Extremely useful for things like stopping dialog system continually triggering
# I.E. "player" seeing "input activation" on the same frame dialog closes
func neutralize_inputs():
	input_direction = null
	input_activation = null
	input_pause_menu = null


# Give other systems the ability to disable ALL input until a given trigger
# Useful for things like letting menu animations or scene transitions finish
func disable_input_until(wait_for_this_object, to_finish_this):
	neutralize_inputs()
	set_process(false)
	yield(wait_for_this_object, to_finish_this)
	set_process(true)


# Just for "game over" basically
func disable_input():
	neutralize_inputs()
	set_process(false)


func toggle_pause_menu():
	# Don't allow menu to be opened while dialog is in progress
	if dialog_active or not pause_menu_allowed:
		return
	pause_menu_active = !pause_menu_active
	if pause_menu_active:
		UI.show_pause_menu()
	else:
		UI.hide_pause_menu()
	yield(UI.animation_player, "animation_finished")
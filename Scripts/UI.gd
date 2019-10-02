extends CanvasLayer

onready var pause_menu = $PauseMenu # PauseMenu, which should always be available in-game
onready var animation_player = $AnimationPlayer
onready var inventory = $Inventory

func game_over():
	$GameOver.visible = true
	animation_player.play("GameOver")
	InputSystem.disable_input()


func demo_over():
	$DemoOver.visible = true
	animation_player.play("DemoOver")
	InputSystem.disable_input()


func fade_transition_scene(scene):
	$FadePanel.visible = true
	animation_player.play("FadeOut")
	InputSystem.disable_input_until(animation_player, "animation_finished")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(scene)
	animation_player.play("FadeIn")
	InputSystem.disable_input_until(animation_player, "animation_finished")
	yield(animation_player, "animation_finished")
	$FadePanel.visible = false


func hide_pause_menu():
	animation_player.play("PauseMenuOut")
	InputSystem.disable_input_until(animation_player, "animation_finished")
	yield(animation_player, "animation_finished")
	get_tree().paused = false
	pause_menu.hide()


func show_pause_menu():
	get_tree().paused = true
	animation_player.play("PauseMenuIn")
	InputSystem.disable_input_until(animation_player, "animation_finished")
	pause_menu.popup()
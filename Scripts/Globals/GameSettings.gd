extends Node

const SETTINGS_SAVE_PATH = "res://save_data/settings.json"
var settings = {}

var default_master_volume = 1.0
var default_music_volume = 0.7
var default_effects_volume = 1.0
var default_master_mute = false
var default_music_mute = false
var default_effects_mute = false
var default_do_not_check = false

var master_volume
var music_volume
var effects_volume
var master_mute
var music_mute
var effects_mute
var do_not_check

func save():
	settings = {
		master_volume = master_volume,
		music_volume = music_volume,
		effects_volume = effects_volume,
		master_mute = master_mute,
		music_mute = music_mute,
		effects_mute = effects_mute,
		do_not_check = do_not_check
	}
	var settings_file = File.new()
	settings_file.open(SETTINGS_SAVE_PATH, File.WRITE)
	settings_file.store_line(to_json(settings))
	settings_file.close()


func load():
	var settings_file = File.new()
	if(not settings_file.file_exists(SETTINGS_SAVE_PATH)):
		default_settings()
		return

	settings_file.open(SETTINGS_SAVE_PATH, File.READ)
	var data = {}
	data = parse_json(settings_file.get_as_text())

	master_volume = data['master_volume']
	music_volume = data['music_volume']
	effects_volume = data['effects_volume']
	master_mute = data['master_mute']
	music_mute = data['music_mute']
	effects_mute = data['effects_mute']
	do_not_check = data['do_not_check']


func default_settings():
	master_volume = default_master_volume
	music_volume = default_music_volume
	effects_volume = default_effects_volume
	master_mute = default_master_mute
	music_mute = default_music_mute
	effects_mute = default_effects_mute
	do_not_check = default_do_not_check
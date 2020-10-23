extends Node

const DEBUG = true

var has_coin = false setget set_has_coin
var coin_given = false setget set_coin_given
var has_arm = false setget set_has_arm
var vent_open = false setget set_vent_open
var has_sun = false setget set_has_sun
var has_power = false setget set_has_power
var has_eye = false setget set_has_eye
var vault_open = false setget set_vault_open

func _init():
	OS.min_window_size = OS.window_size
	OS.max_window_size = OS.get_screen_size()

func _unhandled_input(_event):
	if _event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = not OS.window_fullscreen
		get_tree().set_input_as_handled()

func set_has_coin(_new_value):
	$UI/Inventory/Coin.set_visible(true)
	has_coin = _new_value
	return
func set_coin_given(_new_value):
	$UI/Inventory/Coin.set_visible(false)
	coin_given = _new_value
	return
func set_has_arm(_new_value):
	$UI/Inventory/Arm.set_visible(true)
	has_arm = _new_value
	return
func set_vent_open(_new_value):
	$UI/Inventory/Arm.set_visible(false)
	vent_open = _new_value
	return
func set_has_sun(_new_value):
	print("1")
	$UI/Inventory/Sun.set_visible(true)
	print("2")
	has_sun = _new_value
	return
func set_has_power(_new_value):
	$UI/Inventory/Sun.set_visible(false)
	has_power = _new_value
	return
func set_has_eye(_new_value):
	$UI/Inventory/Eye.set_visible(true)
	has_eye = _new_value
	return
func set_vault_open(_new_value):
	$UI/Inventory/Eye.set_visible(false)
	vault_open = _new_value
	return

extends Node2D

onready var _west_stairs = "res://scenes/Rooms/WestStairs.tscn"
onready var _east_stairs = "res://scenes/Rooms/EastStairs.tscn"
onready var _vent = "res://scenes/Rooms/Maze/A.tscn"
onready var _engine = "res://scenes/Rooms/Engine.tscn"
onready var flashlight = $Flashlight

func _ready():
	Sound.play_music()
	Sound.stop_ambience()
	flashlight.on_enter()
	if Globals.vent_open:
		_STATE_vent_open()

func _on_to_west_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_west_stairs)

func _on_to_east_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_east_stairs)

func _on_to_vent_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
#		if GameState.has_sun:
		if Globals.has_sun:
			flashlight.on_exit()
			get_tree().change_scene(_engine)
		elif Globals.vent_open:
			flashlight.on_exit()
			get_tree().change_scene(_vent)
		elif Globals.has_arm:
			Globals.vent_open = true
			_STATE_vent_open()

func _STATE_vent_open():
	$background_open.set_visible(true)

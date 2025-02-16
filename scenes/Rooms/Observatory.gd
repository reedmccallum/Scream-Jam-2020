extends Node2D

onready var _west_stairs = "res://scenes/Rooms/WestStairs.tscn"
onready var _east_stairs = "res://scenes/Rooms/EastStairs.tscn"
onready var _vent = "res://scenes/Rooms/Maze/A.tscn"
onready var _engine = "res://scenes/Rooms/Engine.tscn"
onready var flashlight = $Flashlight

func _ready():
	if not Sound.music.is_playing():
		Sound.play_music()
	Sound.stop_ambience()
	flashlight.on_enter()
	if Globals.vent_open:
		_STATE_vent_open()
	if Globals.has_power:
		$water.set_modulate(Color("#0f143a54"))

func _on_to_west_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_west_stairs) != OK:
			print("Error on scene change to %s" % _west_stairs)

func _on_to_east_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_east_stairs) != OK:
			print("Error on scene change to %s" % _east_stairs)

func _on_to_vent_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		if Globals.has_sun:
			flashlight.on_exit()
			Sound.play_vent_move()
			if get_tree().change_scene(_engine) != OK:
				print("Error on scene change to %s" % _engine)
		elif Globals.vent_open:
			flashlight.on_exit()
			Sound.play_vent_move()
			if get_tree().change_scene(_vent) != OK:
				print("Error on scene change to %s" % _vent)
		elif Globals.has_arm:
			Globals.vent_open = true
			Sound.play_open_vent()
			_STATE_vent_open()

func _STATE_vent_open():
	$background_open.set_visible(true)

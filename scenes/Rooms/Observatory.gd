extends Node2D

onready var _west_stairs = "res://scenes/Rooms/WestStairs.tscn"
onready var _east_stairs = "res://scenes/Rooms/EastStairs.tscn"
onready var _vent = "res://scenes/Rooms/Maze/A.tscn"
onready var _engine = "res://scenes/Rooms/Engine.tscn"

func _ready():
	pass

func _on_to_west_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		get_tree().change_scene(_west_stairs)

func _on_to_east_stairs_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		get_tree().change_scene(_east_stairs)

func _on_to_vent_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		if GameState.has_sun:
			get_tree().change_scene(_engine)
		elif GameState.vent_open:
			get_tree().change_scene(_vent)

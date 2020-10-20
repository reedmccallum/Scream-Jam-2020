extends Node2D

onready var _west_stairs = preload("res://scenes/Rooms/WestStairs.tscn")
onready var _east_stairs = preload("res://scenes/Rooms/EastStairs.tscn")
onready var _vent = preload("res://scenes/Rooms/Maze/A.tscn")
onready var _engine = preload("res://scenes/Rooms/Engine.tscn")

var _vent_open = false
var _maze_complete = false

func _ready():
	pass

func _on_to_west_stairs_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_west_stairs)

func _on_to_east_stairs_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_east_stairs)

func _on_to_vent_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		if _maze_complete:
			get_tree().change_scene_to(_engine)
		 elif _vent_open:
			get_tree().change_scene_to(_vent)

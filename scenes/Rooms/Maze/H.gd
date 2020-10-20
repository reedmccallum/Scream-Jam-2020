extends Node2D

onready var _to_front = preload("res://scenes/Rooms/Engine.tscn")
#onready var _to_left = preload("res://scenes/Rooms/Maze/B1.tscn")
#onready var _to_right = preload("res://scenes/Rooms/Maze/B.tscn")
onready var _to_back = preload("res://scenes/Rooms/Maze/G.tscn")

var _has_sun = false
var _maze_complete = false

func _on_sun_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("sun gathered")
		_has_sun = true
		$sun.set_visible(false)
		
	pass # Replace with function body.

func _on_to_front_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		_maze_complete = true
		get_tree().change_scene_to(_to_front)
	pass

func _on_to_left_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
#		print("portal clicked")
#		get_tree().change_scene_to(_to_left)
	pass

func _on_to_right_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
#		print("portal clicked")
#		get_tree().change_scene_to(_to_right)
	pass

func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_back)
	pass


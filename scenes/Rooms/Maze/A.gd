extends Node2D

onready var _to_observatory = preload("res://scenes/Rooms/Observatory.tscn")
onready var _to_B = preload("res://scenes/Rooms/Maze/B.tscn")

func _on_to_B_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_B)

func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_observatory)

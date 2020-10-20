extends Node2D

#onready var _to_front = preload("res://scenes/Rooms/Maze/C.tscn")
onready var _to_left = preload("res://scenes/Rooms/Maze/H.tscn")
#onready var _to_right = preload("res://scenes/Rooms/Maze/B.tscn")
onready var _to_back = preload("res://scenes/Rooms/Maze/F.tscn")

func _on_to_front_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
#		print("portal clicked")
#		get_tree().change_scene_to(_to_front)
	pass

func _on_to_left_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_left)
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

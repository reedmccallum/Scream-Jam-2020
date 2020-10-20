extends Node2D

onready var _to_observatory = preload("res://scenes/Rooms/Observatory.tscn")

func _on_back_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_observatory)

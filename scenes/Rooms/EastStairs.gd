extends Node2D

onready var _to_observatory = "res://scenes/Rooms/Observatory.tscn"

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		get_tree().change_scene(_to_observatory)

extends Node2D

onready var _to_lab_door = preload("res://scenes/Rooms/LabDoor.tscn")

var _has_arm = false

func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_lab_door)


func _on_arm_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("arm taken")
		_has_arm = true
		$arm.set_visible(false)

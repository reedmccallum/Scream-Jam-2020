extends Node2D

onready var _to_lab_door = "res://scenes/Rooms/LabDoor.tscn"

func _ready():
	if GameState.has_arm:
		_STATE_has_arm()

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		get_tree().change_scene(_to_lab_door)

func _on_arm_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("arm taken")
		GameState.has_arm = true
		_STATE_has_arm()

func _STATE_has_arm():
	$arm.set_visible(false)

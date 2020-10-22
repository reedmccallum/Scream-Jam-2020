extends Node2D

onready var _to_lab_door = "res://scenes/Rooms/LabDoor.tscn"
onready var _to_vault_door = "res://scenes/Rooms/VaultDoor.tscn"
onready var _to_observatory = "res://scenes/Rooms/Observatory.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()

func _on_to_lab_door_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_to_lab_door)

func _on_to_vault_door_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_to_vault_door)

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_to_observatory)

extends Node2D

onready var _to_lab_door = preload("res://scenes/Rooms/LabDoor.tscn")
onready var _to_vault_door = preload("res://scenes/Rooms/VaultDoor.tscn")
onready var _to_observatory = preload("res://scenes/Rooms/Observatory.tscn")

func _ready():
	pass

func _on_to_lab_door_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_lab_door)


func _on_to_vault_door_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_vault_door)


func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_observatory)

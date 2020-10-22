extends Node2D

onready var _to_observatory = "res://scenes/Rooms/Observatory.tscn"
onready var _to_B = "res://scenes/Rooms/Maze/B.tscn"

func _ready():
	$Flashlight.on_enter()
	Sound.play_vent_move()
	$Flashlight/Light.texture_scale *= 2

func _on_to_B_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		$Flashlight.on_exit()
		get_tree().change_scene(_to_B)

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		$Flashlight.on_exit()
		get_tree().change_scene(_to_observatory)

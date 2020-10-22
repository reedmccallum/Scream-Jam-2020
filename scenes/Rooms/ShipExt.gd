extends Node2D

onready var _next_scene = "res://scenes/Rooms/Observatory.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()

func _on_enter_ship_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		Sound.play_open_vent()
		flashlight.on_exit()
		get_tree().change_scene(_next_scene)

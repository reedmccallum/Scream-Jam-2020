extends Node2D

onready var _next_scene = "res://scenes/Rooms/ShipExt.tscn"
onready var flashlight = $Flashlight

func _ready():
	Sound.play_ambience()
	flashlight.on_enter()

func _on_ship_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_next_scene)
		

extends Node2D

onready var _to_observatory = "res://scenes/Rooms/Observatory.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_to_observatory) != OK:
			print("Error on scene change to %s" % _to_observatory)

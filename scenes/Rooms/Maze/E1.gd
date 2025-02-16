extends Node2D

#onready var _to_front = "res://scenes/Rooms/Maze/C.tscn"
#onready var _to_left = "res://scenes/Rooms/Maze/B1.tscn"
#onready var _to_right = "res://scenes/Rooms/Maze/B.tscn"
onready var _to_back = "res://scenes/Rooms/Maze/E.tscn"

func _ready():
	$Flashlight.on_enter()
	Sound.play_vent_move()
	$Flashlight/Light.texture_scale *= 2

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		$Flashlight.on_exit()
		if get_tree().change_scene(_to_back) != OK:
			print("Error on scene change to %s" % _to_back)
	pass

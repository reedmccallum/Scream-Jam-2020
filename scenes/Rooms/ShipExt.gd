extends Node2D

onready var _next_scene = preload("res://scenes/Rooms/Observatory.tscn")
func _ready():
	pass


func _on_enter_ship_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_next_scene)

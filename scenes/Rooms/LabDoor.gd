extends Node2D

var _has_coin = false
var _coin_given = false

onready var _to_lab = preload("res://scenes/Rooms/Lab.tscn")
onready var _to_west_stairs = preload("res://scenes/Rooms/WestStairs.tscn")

func _on_to_lab_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		if _coin_given:
			get_tree().change_scene_to(_to_lab)


func _on_ghost_hand_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("ghost hand clicked")
		if _has_coin:
			$ghost_hand.set_visible(false)
			_coin_given = true


func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(_to_west_stairs)

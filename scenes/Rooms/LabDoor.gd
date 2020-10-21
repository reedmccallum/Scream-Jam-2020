extends Node2D

onready var _to_lab = "res://scenes/Rooms/Lab.tscn"
onready var _to_west_stairs = "res://scenes/Rooms/WestStairs.tscn"

func _ready():
	if GameState.coin_given:
		_STATE_coin_given()

func _on_to_lab_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		if GameState.coin_given:
			get_tree().change_scene(_to_lab)

func _on_ghost_hand_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("ghost hand clicked")
		if GameState.has_coin:
			GameState.coin_given = true
			_ready()

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		get_tree().change_scene(_to_west_stairs)

func _STATE_coin_given():
	$ghost_hand.set_visible(false)

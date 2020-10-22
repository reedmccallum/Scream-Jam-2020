extends Node2D

onready var _to_lab = "res://scenes/Rooms/Lab.tscn"
onready var _to_west_stairs = "res://scenes/Rooms/WestStairs.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()
#	if GameState.coin_given:
	if Globals.coin_given:
		_STATE_coin_given()

func _on_to_lab_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
#		if GameState.coin_given:
		if Globals.coin_given:
			flashlight.on_exit()
			get_tree().change_scene(_to_lab)

func _on_ghost_hand_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("ghost hand clicked")
#		if GameState.has_coin:
		if Globals.has_coin:
			Sound.play_coin()
#			GameState.coin_given = true
			Globals.coin_given = true
#			_ready() why is this here??

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		get_tree().change_scene(_to_west_stairs)

func _STATE_coin_given():
	$ghost_hand.set_visible(false)

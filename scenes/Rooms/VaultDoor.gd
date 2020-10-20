extends Node2D

var _has_coin = false
var _has_power = false

enum State {
	CLOSED,
	POWERED,
	OPEN
}

func _ready():
	if _has_power && State != OPEN:
		State = POWERED
		$background_powered.set_visible(true)

onready var _to_vault = preload("res://scenes/Rooms/Vault.tscn")
onready var _to_west_stairs = preload("res://scenes/Rooms/WestStairs.tscn")

func _on_to_vault_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		if  State == OPEN:
			get_tree().change_scene_to(_to_vault)

func _on_screen_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("screen clicked")
		if State == POWERED:
			State = OPEN
			$background_open.set_visible(true)


func _on_coin_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		_has_coin = true
		print("coin gathered")
		$coin.set_visible(false)


func _on_back_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("portal clicked")
		get_tree().change_scene_to(to_west_stairs)

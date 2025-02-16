extends Node2D

onready var flashlight = $Flashlight
onready var _to_vault = "res://scenes/Rooms/Vault.tscn"
onready var _to_west_stairs = "res://scenes/Rooms/WestStairs.tscn"

func _ready():
	flashlight.on_enter()
	if Globals.has_coin:
		$coin.set_visible(false)
		$coin.set_monitorable(false)
	if Globals.vault_open:
		$background_open.set_visible(true)
	elif Globals.has_power:
		$background_powered.set_visible(true)
		$water.set_modulate(Color("#0f143a54"))
	

func _on_to_vault_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
#		if  GameState.vault_open:
		if  Globals.vault_open:
			flashlight.on_exit()
			if get_tree().change_scene(_to_vault) != OK:
				print("Error on scene change to %s" % _to_vault)

func _on_screen_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("screen clicked")
		if Globals.has_power:
			Globals.vault_open = true
			$screen.set_monitorable(false)
			Sound.play_vault_open()
			$background_open.set_visible(true)

func _on_coin_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		Globals.has_coin = true
		print("coin gathered")
		Sound.play_coin()
		$coin.set_visible(false)
		$coin.set_monitorable(false)

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_to_west_stairs) != OK:
			print("Error on scene change to %s" % _to_west_stairs)

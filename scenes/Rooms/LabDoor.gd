extends Node2D

onready var _to_lab = "res://scenes/Rooms/Lab.tscn"
onready var _to_west_stairs = "res://scenes/Rooms/WestStairs.tscn"
onready var flashlight = $Flashlight
onready var ghost_animation = $ghost_hand/Sprite/AnimationPlayer

func _ready():
	flashlight.on_enter()
	ghost_animation.play("Ghost")
	if Globals.coin_given:
		_STATE_coin_given()
	if Globals.has_power:
		$water.set_modulate(Color("#0f143a54"))

func _on_to_lab_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		if Globals.coin_given:
			flashlight.on_exit()
			if get_tree().change_scene(_to_lab) != OK:
				print("Error on scene change to %s" % _to_lab)

func _on_ghost_hand_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("ghost hand clicked")
		if Globals.has_coin:
			Sound.play_vault_open(.5)
			Sound.play_coin()
			Globals.coin_given = true
			_STATE_coin_given()

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_to_west_stairs) != OK:
			print("Error on scene change to %s" % _to_west_stairs)

func _STATE_coin_given():
	$ghost_hand.set_visible(false)
	$ghost_head.set_visible(true)
	$ghost_head/AnimationPlayer.play("Ghost")
	$background_open.set_visible(true)
	$to_lab.set_visible(true)
	$to_lab.set_monitorable(true)

extends Node2D

onready var flashlight = $Flashlight
onready var _observatory = "res://scenes/Rooms/Observatory.tscn"

func _ready():
	flashlight.on_enter()
	if Globals.has_power:
		_STATUS_has_power()
	pass # Replace with function body.

func _STATUS_has_power():
	$background_light.set_visible(true)
	$engine_off.set_visible(false)
	$engine_on.set_visible(true)
	$engine_on/AnimationPlayer.play("pulse")
	$Flashlight.flashlight_off()
	if not Sound.fire_furnace.is_playing():
		Sound.play_fire_furnace()
	if not Globals.has_eye:
		$eye.set_visible(true)
		$eye/Sprite/AnimationPlayer.play("eye_float")

func _on_vent_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		Sound.play_vent_move()
		if get_tree().change_scene(_observatory) != OK:
			print("Error on scene change to %s" % _observatory)

func _on_engine_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("engine clicked")
		Sound.play_fire_furnace()
		Globals.has_power = true
		_STATUS_has_power()
	pass # Replace with function body.

func _on_eye_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("eye clicked")
		Globals.has_eye = true
		Sound.play_eye_squish()
		$eye.set_visible(false)
		

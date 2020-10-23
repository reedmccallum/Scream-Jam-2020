extends Node2D

onready var _to_lab_door = "res://scenes/Rooms/LabDoor.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()
	$backpod/AnimationPlayer.play("backpod")
	if Globals.has_arm:
		_STATE_has_arm()

func _on_back_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("portal clicked")
		flashlight.on_exit()
		if get_tree().change_scene(_to_lab_door) != OK:
			print("Error on scene change to %s" % _to_lab_door)

func _on_arm_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		print("arm taken")
		Sound.play_arm_break()
		Globals.has_arm = true
#		GameState.has_arm = true
		_STATE_has_arm()

func _STATE_has_arm():
	$arm.set_visible(false)

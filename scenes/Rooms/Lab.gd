extends Node2D

onready var _to_lab_door = "res://scenes/Rooms/LabDoor.tscn"
onready var flashlight = $Flashlight

func _ready():
	flashlight.on_enter()
	$backpod/AnimationPlayer.play("backpod")
	$final_anim/final_anim.hide()
	$water.set_modulate(Color("021f89bd"))
	if Globals.has_arm:
		_STATE_has_arm()
	if Globals.has_power:
		$water.set_modulate(Color("#0f143a54"))
	if Globals.final_anim:
		_STATE_final_anim()

func _STATE_final_anim():
	$final_anim/final_anim.show()
	$final_anim.play("final_anim")

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
		_STATE_has_arm()

func _STATE_has_arm():
	$arm.set_visible(false)
	$arm.set_monitorable(false)


func _on_final_anim_animation_finished(_anim_name):
	if get_tree().change_scene("res://scenes/Credits.tscn") != OK:
		print("so close, so far")
	pass # Replace with function body.

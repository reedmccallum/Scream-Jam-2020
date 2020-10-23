extends Node2D

onready var _to_lab = "res://scenes/Rooms/Lab.tscn"

func _ready():
	$final_scene.set_frame(0)
	$foreground_sand.set_modulate(Color("00ffffff"))
	$foreground_treasure.set_modulate(Color("ffffff"))
	$water.set_modulate(Color("0f143a54"))
	pass # Replace with function body.


func _on_pile_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		Cursor.hide()
		Globals.final_anim = true
		Globals.hide_ui()
		$final_scene/AnimationPlayer.play("final_scene")
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(_anim_name):
	if get_tree().change_scene(_to_lab) != OK:
		print("Error on scene change to %s" % _to_lab)
	pass # Replace with function body.

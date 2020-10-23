extends Node2D

onready var _first_scene = "res://scenes/Rooms/Reef.tscn"

func _on_Area2D_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		Cursor.hide()
		$Sprite/AnimationPlayer.play("title_sequence")
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(_anim_name):
	Cursor.show()
	if get_tree().change_scene(_first_scene) != OK:
		print("Error on scene change to %s" % _first_scene)
	pass # Replace with function body.

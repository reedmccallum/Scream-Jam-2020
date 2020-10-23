extends Node2D

func _ready():
	$Sun/AnimationPlayer.play("fire")

func _on_Exit_input_event(_viewport, _event, _shape_idx):
	if _event is InputEventMouseButton && _event.button_index == BUTTON_LEFT && _event.pressed:
		get_tree().quit()
	pass # Replace with function body.

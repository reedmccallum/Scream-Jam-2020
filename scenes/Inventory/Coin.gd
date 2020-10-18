extends Area2D

signal coin_gathered

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func _on_Coin_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("Coin clicked")
		emit_signal("coin_gathered")
		$Coin.set_visibility(false)

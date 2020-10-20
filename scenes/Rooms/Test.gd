extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Coin_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("Coin clicked")
		emit_signal("coin_gathered")
		$Coin.set_visible(false)

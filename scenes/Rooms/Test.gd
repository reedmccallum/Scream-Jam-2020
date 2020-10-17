extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Helmet_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		print("Helmet pressed")
		# add Helmet to inventory
		$Helmet.set_visible(false)
		$Helmet/PopupDialog.popup(0, 20, 20, 40)
	pass # Replace with function body.

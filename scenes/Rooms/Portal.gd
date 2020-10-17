extends Area2D


onready var _next_scene = preload("res://scenes/Interactable/Helmet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Portal_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed:
		get_tree().change_scene_to(_next_scene)
	pass # Replace with function body.
